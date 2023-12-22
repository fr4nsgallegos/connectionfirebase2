import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  CollectionReference userReference =
      FirebaseFirestore.instance.collection("USERS");
  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(Duration(seconds: 2));
    }
  }

  Future<int> getNumber() async {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    getNumber().then((value) {
      print(value);
    });

    counter().listen(
      (event) {
        print(event);
      },
    );
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
