import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  String id;
  String nombre;
  int votos;

  CardWidget({required this.id, required this.nombre, required this.votos});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection('USERS');

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Row(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 300,
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                      title: Text(widget.nombre),
                      subtitle: Text('Por la Ciudad de Lima (${widget.votos})'),
                      leading: Icon(Icons.home),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  usersReference
                      .doc(widget.id)
                      .update({"votos": widget.votos++});
                  setState(() {});
                },
                child: Text("votar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
