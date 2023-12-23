import 'package:conectionfirebase2/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  Color bgColor;
  CreatePage({required this.bgColor});
  TextEditingController _correoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Widget fondo() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xFF012F3D),
            // Color(0xFF0A4F64),
            bgColor.withOpacity(0.8),

            bgColor,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            fondo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "APP DE VOTACIONES",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Crea una cuenta",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Correo electronico",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 60,
                        child: TextField(
                          controller: _correoController,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Constraseña",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 60,
                        child: TextField(
                          controller: _passwordController,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _firebaseAuth.createUserWithEmailAndPassword(
                          email: _correoController.text,
                          password: _passwordController.text,
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("Crear cuenta"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                      // try {
                      //   await _firebaseAuth.signInWithEmailAndPassword(
                      //       email: _correoController.text,
                      //       password: _passwordController.text);
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("ya inicio sesion"),
                      //     ),
                      //   );
                      // } catch (e) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //         e.toString(),
                      //       ),
                      //     ),
                      //   );
                      // }
                    },
                    child: Text("Iniciar sesión"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
