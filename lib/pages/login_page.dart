import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _correoController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();

  String nameUser = '';

  String emailUser = '';

  Widget fondo() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF012F3D),
            Color(0xFF0A4F64),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      setState(() {
        nameUser = user!.displayName.toString();
        emailUser = user.email.toString();
      });
    } catch (e) {}
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
                    "Inicia sesión",
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
                        await _firebaseAuth.signInWithEmailAndPassword(
                            email: _correoController.text,
                            password: _passwordController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("ya inicio sesion"),
                          ),
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
                    child: Text("Iniciar sesión"),
                  ),
                  IconButton(
                    onPressed: () {
                      _signInWithGoogle().then((value) {
                        print(nameUser);
                        print(emailUser);
                      });
                    },
                    icon: Icon(
                      Icons.g_mobiledata,
                      color: Colors.white,
                      size: 50,
                    ),
                    style: IconButton.styleFrom(),
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
