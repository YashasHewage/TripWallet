// ignore_for_file: prefer_const_constructors

import 'package:app/pages/Expences_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/loading_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/signup_con_page.dart';
import 'package:app/pages/signup_per_page.dart';
import 'package:app/widgets/all_expences_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loading(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/expencespage': (context) => const ExpencesState(),
        '/allexpences': (context) => const AllExpences(),
        '/login': (context) => const LoginPage(),
        '/person': (context) => const Signupperinfo(),
        '/concat': (context) => const Signupcon(),
      },
    );
  }
}
