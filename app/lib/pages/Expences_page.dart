// ignore_for_file: unused_element, prefer_const_constructors, file_names, camel_case_types, non_constant_identifier_names

import 'package:app/Models/expence.dart';
import 'package:app/widgets/add_new_expence.dart';
import 'package:app/widgets/expence_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



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
    Colors.green[900]!,
    Colors.yellow[800]!,
    Colors.lightBlue[300]!,
    Colors.red[900]!,
    Colors.blueAccent[200]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset('assets/tripcard.png'),
          ),
          //pie chart
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  color: Color(0xFF314874),
                  border: Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PieChart(
                    swapAnimationDuration: const Duration(milliseconds: 700),
                    PieChartData(
                      sections: List.generate(
                        dataMap.length,
                        (index) => PieChartSectionData(
                          color: pieChartColors[index],
                          value: dataMap.values.elementAt(index),
                          title: '',
                        ),
                      ),
                      sectionsSpace: 0,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  //total expenses
                  Text(
                    "LKR.${totalCategoryVal.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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

          ExpenceList(
            expenceList: _expenceList,
            onDeletedExpence: OnDeletedExpence,
          ),
        ],
      ),
      //bottom navigation icons
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //home icon
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
            icon: Icon(Icons.home),
            iconSize: 35,
          ),

          //add icon
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFF213660)),
            child: IconButton(
              onPressed: () => _openAddExpensesOverlay(context),
              icon: Icon(Icons.add),
              iconSize: 35,
              color: Colors.white,
            ),
          ),
          //profile icon
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            iconSize: 35,
          ),
        ],
      ),
    );
  }
}
