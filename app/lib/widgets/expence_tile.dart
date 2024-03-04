// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/Models/expence.dart';
import 'package:flutter/material.dart';


class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(195, 207, 230, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: CategoryColor[expence.category],
                  radius: 30,
                  child: Icon(
                    CategoryIcons[expence.category],
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                //title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    expence.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color(0xFF213660), fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                //amount
                Column(
                  children: [
                    Text(
                      expence.amount.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Color(0xFF213660),
                          fontWeight: FontWeight.bold),
                    ),
                    //date
                    SizedBox(height: 5),
                    Text(
                      expence.getFormatedDate,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
