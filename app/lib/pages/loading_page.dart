// ignore_for_file: prefer_const_constructors, camel_case_types
              import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only( top:60,bottom: 30),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 350, 
                  height: 350, 
                  child: Image.asset('assets/loading.png'),
                ),
              ),

                            Text(
                              "Seamless travel ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, 
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "money management",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, 
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              margin: EdgeInsets.only(top: 30, left: 30, right: 30), 
                              child: Text(
                                " Sit back, relax, and get ready for a stress-",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5), 
                              child: Text(
                                "free financial journey with our app",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                            ),
              //next button
              Container(
                margin: EdgeInsets.only(top: 70), 
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/loginpage');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
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
                      style: GoogleFonts.poppins(
                        color: Colors.white, 
                        fontSize: 18,
                      ),
                    ),
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
