// ignore_for_file: unused_element, prefer_const_constructors, file_names, camel_case_types, non_constant_identifier_names

import 'package:app/Models/expence.dart';
import 'package:app/pages/default_addtrip.dart';
import 'package:app/widgets/add_new_expence.dart';
import 'package:app/widgets/expence_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpencesState extends StatefulWidget {
  const ExpencesState({super.key});

  @override
  State<ExpencesState> createState() => _Expences_StateState();
}

class _Expences_StateState extends State<ExpencesState> {
  //expences list
  final List<ExpenceModel> _expenceList = [
    ExpenceModel(
        title: "rice",
        amount: 500,
        date: DateTime.now(),
        category: Category.food),
    ExpenceModel(
        title: "travel",
        amount: 100,
        date: DateTime.now(),
        category: Category.transport),
  ];
  //Pie chart
  Map<String, double> dataMap = {
    "Food": 0,
    "Transport": 0,
    "Grocerry": 0,
    "Health": 0,
    "Other": 0,
  };
  //add new expence
  void onAddNewExpence(ExpenceModel expence) {
    setState(() {
      _expenceList.add(expence);
      calCategoryTotal();
    });
  }

  // remove a expence
  void OnDeletedExpence(ExpenceModel expence) {
    //store the delete expence
    ExpenceModel detetingExpence = expence;
    //get the removing expence id
    final int removingIndex = _expenceList.indexOf(expence);

    setState(() {
      _expenceList.remove(expence);
      calCategoryTotal();
    });
    //show snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Delete sucessfull"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _expenceList.insert(removingIndex, detetingExpence);
                calCategoryTotal();
              });
            }),
      ),
    );
  }

  //sum of category valu
  double totalCategoryVal = 0;

  //pie chart data
  double foodVal = 0;
  double transVal = 0;
  double grocerryVal = 0;
  double healtVal = 0;
  double otherVal = 0;

  void calCategoryTotal() {
    double foodValTotal = 0;
    double transValTotal = 0;
    double grocerryValTotal = 0;
    double healtValTotal = 0;
    double otherValTotal = 0;

    for (final expence in _expenceList) {
      if (expence.category == Category.food) {
        foodValTotal += expence.amount;
      }
      if (expence.category == Category.transport) {
        transValTotal += expence.amount;
      }
      if (expence.category == Category.grocerry) {
        grocerryValTotal += expence.amount;
      }
      if (expence.category == Category.health) {
        healtValTotal += expence.amount;
      }
      if (expence.category == Category.other) {
        otherValTotal += expence.amount;
      }
    }
    setState(() {
      foodVal = foodValTotal;
      transVal = transValTotal;
      grocerryVal = grocerryValTotal;
      healtVal = healtValTotal;
      otherVal = otherValTotal;

      //calculate overall total
      totalCategoryVal = foodVal + transVal + grocerryVal + healtVal + otherVal;
    });
    //update the data map
    dataMap = {
      "Food": foodVal,
      "Transport": transVal,
      "Grocerry": grocerryVal,
      "Health": healtVal,
      "Other": otherVal,
    };
  }

  @override
  void initState() {
    super.initState();
    calCategoryTotal();
  }

  _openAddExpensesOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddNewExpence(
            onAddExpence: onAddNewExpence,
          );
        });
  }

  List<Color> pieChartColors = [
    Color.fromARGB(255, 62, 141, 12),
    Color.fromARGB(255, 255, 170, 42),
    Color.fromARGB(255, 80, 200, 255),
    Color.fromARGB(255, 252, 46, 46),
 Color.fromARGB(255, 35, 81, 167),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 198,
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dashboard_image1.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 50.0,
                      left: 20), 
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/addtrip');
                    },
                    child: CircleAvatar(
                      radius: 16.0, 
                      backgroundColor: Colors.white, 
                      child: Icon(
                        Icons.home_outlined, 
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.0, top: 70),
                  child: Center(
                    child: Text(
                      'Paris',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  left: 20,
                  child: Container(
                    width: 351,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Total Expenses',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15.0),
                          child: Text(
                            "LKR.${totalCategoryVal.toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //pie chart
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFF314874),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 25.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PieChart(
                          swapAnimationDuration:
                              const Duration(milliseconds: 700),
                          PieChartData(
                            sections: List.generate(
                              dataMap.length,
                              (index) => PieChartSectionData(
                                color: pieChartColors[index],
                                value: dataMap.values.elementAt(index),
                                title: '',
                                radius: 25,
                              ),
                            ),
                            sectionsSpace: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      //total expenses
                      Text(
                        "LKR.${totalCategoryVal.toStringAsFixed(2)}",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Add onPressed logic here
                          Navigator.pushNamed(context, '/allexpences');
                        },
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ExpenceList(
              expenceList: _expenceList,
              onDeletedExpence: OnDeletedExpence,
            ),
          ],
        ),
        //bottom navigation icons
        bottomNavigationBar: Container(
          height: 91,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 23,
                child: GestureDetector(
                  onTap: () {
                     Navigator.pushNamed(context, '');
                  },
                  child: Container(
                    width: 500,
                    height: 68,
                    decoration: BoxDecoration(color: Color(0xFFA3A3A3)),
                  ),
                ),
              ),
              Positioned(
                left: 165,
                top: 0,
                child: Container(
                  width: 60,
                  height: 61.44,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 171,
                top: 7,
                child: GestureDetector(
                  onTap: () => _openAddExpensesOverlay(context),
                  child: Container(
                    width: 47.20,
                    height: 48.33,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2B3A58),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 44,
                child: Container(
                  width: 25,
                  height: 25,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 25,
                        height: 25,
                        child: GestureDetector(
                          onTap: () {
                          Navigator.pushNamed(context, '/addtrippopup');
                          },
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Positioned(
                left: 110,
                top: 44,
                child: Container(
                  width: 25,
                  height: 25,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/allexpences');
                        },
                      child: Container(
                        width: 25,
                        height: 25,
                        child: Icon(
                          Icons.money,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    ),
                  ]),
                ),
              ),
              Positioned(
                left: 251,
                top: 44,
                child: Container(
                  width: 25,
                  height: 25,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/expencespage');
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.pie_chart,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Positioned(
                left: 336,
                top: 44,
                child: Container(
                  width: 25,
                  height: 25,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addbudget');
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.wallet,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),

        // onPressed: () => _openAddExpensesOverlay(context),

        );
  }
}
