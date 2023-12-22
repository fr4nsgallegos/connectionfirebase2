import 'package:conectionfirebase2/pages/candidate_page.dart';
import 'package:conectionfirebase2/pages/create_page.dart';
import 'package:conectionfirebase2/pages/home_page.dart';
import 'package:conectionfirebase2/pages/home_page2.dart';
import 'package:conectionfirebase2/pages/login_page.dart';
import 'package:conectionfirebase2/pages/stream_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CandidatePage(),
  ));
}
