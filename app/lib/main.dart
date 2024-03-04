// ignore_for_file: prefer_const_constructors

import 'package:app/pages/Expences_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/widgets/all_expences_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpencesState(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/expencespage': (context) => const ExpencesState(),
        '/allexpences': (context) => const AllExpences(),
      },
    );
  }
}
