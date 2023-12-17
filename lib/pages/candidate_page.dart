import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conectionfirebase2/widgets/card_candidate.dart';
import 'package:flutter/material.dart';

class CandidatePage extends StatefulWidget {
  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection('USERS');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "FirebaseApp",
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: usersReference.get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot userCollection = snapshot.data;
              List<QueryDocumentSnapshot> docs = userCollection.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> myDoc =
                      docs[index].data() as Map<String, dynamic>;
                  print(myDoc);
                  return CardWidget(
                    id: docs[index].id,
                    nombre: "${myDoc["name"]} ${myDoc["lastname"]}",
                    votos: (myDoc["votos"] ?? 0),
                  );
                },
              );
              // return miCard();
            } else {
              return Center(
                child: Text("error"),
              );
            }
          },
        ),
      ),
    );
  }
}
