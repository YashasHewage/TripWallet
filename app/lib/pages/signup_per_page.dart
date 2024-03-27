// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signupperinfo extends StatelessWidget {
  const Signupperinfo({super.key});

  @override
  Widget build(BuildContext context) {
    final firstname = TextEditingController();
    final lastname = TextEditingController();
    final dob = TextEditingController();

    void _saveUserData() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      //get values from user
      String firstName = firstname.text;
      String lastName = lastname.text;
      String dateOfBirth = dob.text;
      String email = FirebaseAuth.instance.currentUser!.email!;

      //adding user data to firestore
      await firestore.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'email': email,
      });
      Navigator.pushNamed(context, '/login');
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),

                // ...

                child: Text('Sign up',
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Personal Info',
                    style: TextStyle(fontSize: 20, color: Color(0xff7494D0))),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    //first name text field
                    MyTextField(
                      controller: firstname,
                      hintText: 'First name',
                      obscureText: false,
                      style: GoogleFonts.poppins(), // Add this line
                    ),
                    SizedBox(height: 40),

                    //Last name text field
                    MyTextField(
                      controller: lastname,
                      hintText: 'Last name',
                      obscureText: false,
                      style: GoogleFonts.poppins(), // Add this line
                    ),
                    SizedBox(height: 40),

                    //date of birth text field
                    MyTextField(
                        controller: dob,
                        hintText: 'Date of birth',
                        obscureText: false,
                        style: GoogleFonts.poppins()), // Add this line
                    SizedBox(height: 40),
                  ],
                ),
              ),
              //next button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _saveUserData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(350, 60),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF213660),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                      style: TextStyle(fontSize: 17)),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginpage');
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
