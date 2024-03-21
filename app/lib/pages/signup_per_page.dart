// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class Signupperinfo extends StatelessWidget {
  const Signupperinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0, top: 65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Sign up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                Column(
                  children: [
                    //first name text feild
                    MyTextField(hintText: 'First name', obscureText: false),
                    SizedBox(height: 40),

                    //Last name text feild
                    MyTextField(hintText: 'Last name', obscureText: false),
                    SizedBox(height: 40),

                    //date of birth text feild
                    MyTextField(hintText: 'Date of birth', obscureText: false),
                    SizedBox(height: 40),
                  ],
                ),
                Spacer(),
                //next button
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signupcon');
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
      ),
    );
  }
}
