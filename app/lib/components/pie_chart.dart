// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 300 ,
      decoration: BoxDecoration(
        color: Color(0xFF213660),
        borderRadius: BorderRadius.circular(55),
      ),
      child: Stack(alignment: Alignment.center,
        children: [
          Text('Total Expenses',style: TextStyle(color: Colors.white,fontSize:20),),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: PieChart(
              PieChartData(
                sections: [
                  //1 item
                  PieChartSectionData(
                    value: 50,
                    color: Colors.blue,
                  ),
                  //2 item
                  PieChartSectionData(
                    value: 40,
                    color: Colors.green,
                  ),
                  //3 item
                  PieChartSectionData(
                    value: 70,
                    color: Colors.red,
                  ),
                  //4 item
                  PieChartSectionData(
                    value: 20,
                    color: Colors.purple,
                  ),
                  //5 item
                  PieChartSectionData(
                    value: 20,
                    color: Colors.yellow,
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 750),
            ),
          ),
        ],
      ),
    );
  }
}
