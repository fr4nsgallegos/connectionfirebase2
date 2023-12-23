import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conectionfirebase2/pages/stream_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Color bgColor;
  HomePage({required this.bgColor});
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection('USERS');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        // appBar: AppBar(
        //   title: const Text(
        //     "FirebaseApp",
        //   ),
        //   centerTitle: true,
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  usersReference.get().then((value) {
                    QuerySnapshot userCollection = value;
                    List<QueryDocumentSnapshot> docs = userCollection.docs;
                    docs.forEach((element) {
                      print(element.id);
                      print(element.data());
                    });
                  });
                },
                child: Text("Obtener data"),
              ),
              ElevatedButton(
                onPressed: () {
                  usersReference.add({
                    'name': 'Roberto',
                    'lastname': 'Rodriguez',
                    'age': 45,
                    'favoriteColor': 'red'
                  }).then((value) {
                    print(value.id);
                  });
                },
                child: Text("Inserción"),
              ),
              ElevatedButton(
                onPressed: () {
                  usersReference.doc('tom').set({
                    'name': 'Anita',
                    'lastName': 'Mengoa',
                    'hijos': 6,
                  }).then((value) {});
                },
                child: Text("Inserción 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  usersReference.doc('tom').update({
                    // "name": 'update',
                    // "lastaName": "update",
                    'hijos': 7,
                  });
                },
                child: Text("Actualizar"),
              ),
              ElevatedButton(
                onPressed: () {
                  usersReference
                      .doc("tom")
                      .delete()
                      .then((value) {})
                      .catchError((error) {
                    print(error);
                  });
                },
                child: Text("Eliminar"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StreamPage(
                                bgColor: Colors.red,
                              )));
                },
                child: Text("Go stream page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
