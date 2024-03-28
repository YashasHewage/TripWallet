// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:google_fonts/google_fonts.dart';

import 'package:app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _obscureText = true;

class _LoginPageState extends State<LoginPage> {
   bool isLoding = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> login() async {
   
    try {
      setState(() {
      isLoding = true;
    });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      print(e);
      return;
    }
     setState(() {
      isLoding = false;
    });

    if (mounted) {
      Navigator.pushNamed(context, '/addtrip');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: isLoding ? Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  // Top text

                  Container(
                    margin: EdgeInsets.only(top: 40.0, left: 10),
                    child: Text(
                      'Welcome Back!',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Few steps ',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Text(
                          'away ',
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 74, 148, 208),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        child: Image.asset('assets/login.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Text fields
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: GoogleFonts.poppins(),
                                hintText: 'Enter an email address',
                                hintStyle: GoogleFonts.poppins(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: GoogleFonts.poppins(),
                                hintText: 'Enter a password',
                                hintStyle: GoogleFonts.poppins(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons
                                            .visibility, // Choose icon based on password visibility
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText =
                                          !_obscureText; // Toggle the state of password visibility
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40),

                      // Login button
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              ui.Size(350, 60),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xFF213660),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 2),

                      // Don't have an account? signup
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/concat');
                            },
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.poppins(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
