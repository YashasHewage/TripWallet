// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/components/my_textfield.dart';
import 'package:flutter/material.dart';


class Signupcon extends StatelessWidget {
  const Signupcon({super.key});

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
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Contact info',
                    style: TextStyle(fontSize: 20, color: Color(0xff7494d0)),
                  ),
                ),
                SizedBox(height: 25),
                //emai text feild
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextField(hintText: 'Email', obscureText: false),
                    SizedBox(height: 40),
                    //contact number text feild
                    MyTextField(hintText: 'Password', obscureText: true),
                    SizedBox(height: 40),
                    MyTextField(hintText: "Confirm Password", obscureText: true)
                  ],
                ),
                Spacer(),
                //next button
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: null,
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

                //Aleady have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 17),
                    ),
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
