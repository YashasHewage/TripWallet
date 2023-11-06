// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Textfieldexpenses extends StatelessWidget {
  const Textfieldexpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Color(0xFFC3CFE6),
          hintText: 'Food',
          prefixIcon: Icon(
            Icons.restaurant,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
