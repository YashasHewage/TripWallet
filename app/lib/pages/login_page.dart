// ignore_for_file: prefer_const_constructors

import 'package:app/components/my_textfield.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Dismiss keyboard when tapped outside of text field
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  //top text
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Few steps away'),

                  Center(child: Image.asset('assets/login.png')),
                  Spacer(),

                  //text field
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextField(
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      SizedBox(height: 25),
                      MyTextField(hintText: 'Password', obscureText: true),

                      SizedBox(height: 100),

                      //Login button
                      ElevatedButton(
                        onPressed: null, // Add your login functionality here
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
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 25),

                      //Don't have an account? signup
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signupper');
                            },
                            child: Text(
                              'sign up',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
