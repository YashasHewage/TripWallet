// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/Models/expence.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right:20,left:20),
      decoration: BoxDecoration(
        border: Border(
        
          bottom: BorderSide(
            color: Colors.grey, 
            width: 1.0,
          ),
        ),
      ),
      child: Card(
        elevation: 0, 
        margin: const EdgeInsets.symmetric(horizontal: 0.0), 
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: CategoryColor[expence.category],
                    radius: 20,
                    child: Icon(
                      CategoryIcons[expence.category],
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  //title
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      expence.title,
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Color.fromARGB(255, 29, 29, 29), fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                  ),
                  Spacer(),
                  //amount
                  Container(
                    margin: const EdgeInsets.only(right:0),
                    child: Column(
                      children: [
                        Text(
                          expence.amount.toStringAsFixed(2),
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Color.fromARGB(255, 29, 29, 29),
                              fontWeight: FontWeight.w400,
                              fontSize:20
                            ),
                          ),
                        ),
                        //date
                        SizedBox(height: 5),
                        Text(
                          expence.getFormatedDate,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: const Color.fromARGB(255, 129, 129, 129),
                              fontWeight: FontWeight.w400,
                              fontSize:12
                            ),
                          ),
                        ),
                      ],
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
