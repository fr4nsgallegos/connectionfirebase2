import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  CollectionReference userReference =
      FirebaseFirestore.instance.collection("USERS");
  StreamController streamController = StreamController();

  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(Duration(seconds: 2));
    }
  }

  streamCounterController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      print("el valor es");
      streamController.add(i);
    }
  }

  Future<int> getNumber() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 1000;
    });
  }

  @override
  void initState() {
    streamCounterController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // getNumber().then((value) {
    //   print(value);
    // });
    print("INIT STREAM");
    Stream<int> myStream = Stream.fromFuture(getNumber());

    print("Stream CREADO");

    streamController.stream.listen((event) {
      print("VALOR DE STREAM");
      print(event);
    }, onDone: () {
      print("STREAM FINALIZADO");
    }, onError: (ERROR) {
      print("ERRRRRORRRR");
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stream Page"),
        ),
        body: StreamBuilder(
          stream: userReference.snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot userCollection = snapshot.data;
              List<QueryDocumentSnapshot> docs = userCollection.docs;
              print(docs[0]["name"]);
              return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        docs[index]["name"],
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

        // FutureBuilder(
        //   future: getNumber(),
        //   builder: (BuildContext context, AsyncSnapshot snapchot) {
        //     if (snapchot.hasData) {
        //       return Center(
        //         child: Text(
        //           snapchot.data.toString(),
        //           style: TextStyle(fontSize: 50),
        //         ),
        //       );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
      ),
    );
  }
}
