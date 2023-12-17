import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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
                  print(myDoc['lastName']);

                  return miCard();
                },
              );
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

Card miCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Row(
      children: [
        Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: 300,
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text("Candidato"),
                    subtitle: Text('Por la Ciudad de Lima'),
                    leading: Icon(Icons.home),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('Votar'),
          ],
        )
      ],
    ),
  );
}
