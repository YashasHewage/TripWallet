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

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );

    }
    setState(() {
      isLoading = false;
    });
    if (mounted) {
      Navigator.pushNamed(context, '/addtrip');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Few steps away',
                          style: GoogleFonts.poppins(),
                        ),
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
                            height: 50,
                            child: MyTextField(
                              controller: emailController,
                              hintText: 'Email',
                              style: GoogleFonts.poppins(),
                              obscureText: false,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height:
                                50, // Change this value to your desired height
                            child: MyTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              style: GoogleFonts.poppins(),
                              obscureText: true,
                            ),
                          ),

                          SizedBox(height: 40),

                          // Login button
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                login();
                              }, // Add your login functionality here
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
    );
  }
}
