// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 45),
          child: Column(
            children: [
              Center(child: Image.asset('assets/loading.png')),
              Text(
                "Seamless travel ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "money management",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                " Sit back, relax, and get ready for a stress-",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "free financial journey with our app",
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              //next button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/login');
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
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
