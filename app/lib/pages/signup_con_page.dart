// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signupcon extends StatefulWidget {
  const Signupcon({super.key});

  @override
  State<Signupcon> createState() => _SignupconState();
}

class _SignupconState extends State<Signupcon> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    Future<void> register() async {
      // Check if passwords match
      if (passwordController.text.trim() !=
          confirmPasswordController.text.trim()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Passwords do not match."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }

      // Check if password is at least 6 characters long
      if (passwordController.text.trim().length < 6) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Password must be at least 6 characters long."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        String userId = userCredential.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'email': emailController.text,
        });
        if (mounted) {
          Navigator.pushNamed(context, '/login');
        }
      } catch (e) {
        print("error:${e.toString()}");
        return;
      }
    }

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
                    MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false),
                    SizedBox(height: 40),
                    //contact number text feild
                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true),
                    SizedBox(height: 40),
                    MyTextField(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: true)
                  ],
                ),
                Spacer(),
                //next button
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: register,
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
                        Navigator.pushNamed(context, '/login');
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
