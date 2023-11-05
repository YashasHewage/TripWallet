// ignore_for_file: prefer_const_constructors

import 'package:app/components/pie_chart.dart';
import 'package:app/pages/expenses_page.dart';
import 'package:app/pages/home_page.dart';
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
      home:Expenses(),
    );
  }
}
