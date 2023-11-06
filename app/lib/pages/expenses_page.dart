// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:app/components/pie_chart.dart';
import 'package:app/components/textfield_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //image
            Container(
              child: Image.asset(
                'assets/expens.png',
                fit: BoxFit.cover,
                width: 1500,
              ),
            ),
            SizedBox(height: 15),
            //pie chart
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MyPieChart(),
            ),
            //textfield
            Expanded(
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    Textfieldexpenses(),
                    Textfieldexpenses(),
                    Textfieldexpenses(),
                    Textfieldexpenses(),
                    Textfieldexpenses(),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
