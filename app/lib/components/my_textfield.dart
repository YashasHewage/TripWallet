// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller; // Added TextEditingController
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller, required TextStyle style});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: TextField(
        controller: widget.controller, // Use the provided controller
        style: TextStyle(color: Colors.black),
        obscureText: widget.obscureText ? _obscureText : false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xFF595A5D)),
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFF595A5D),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
