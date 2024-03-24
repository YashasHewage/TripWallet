// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:app/Models/expence.dart';
import 'package:app/widgets/add_new_expence.dart';
import 'package:app/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AllExpences extends StatefulWidget {
  const AllExpences({super.key});

  @override
  State<AllExpences> createState() => _AllExpencesState();
}

class _AllExpencesState extends State<AllExpences> {
  final List<ExpenceModel> _expenceList = [
    ExpenceModel(
        title: "rice",
        amount: 122,
        date: DateTime.now(),
        category: Category.food),
    ExpenceModel(
        title: "travel",
        amount: 122,
        date: DateTime.now(),
        category: Category.transport),
  ];
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

  //add new expence
  void onAddNewExpence(ExpenceModel expence) {
    setState(() {
      _expenceList.add(expence);
      calCategoryTotal();
    });
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
    setState(
      () {
        foodVal = foodValTotal;
        transVal = transValTotal;
        grocerryVal = grocerryValTotal;
        healtVal = healtValTotal;
        otherVal = otherValTotal;

        //calculate overall total
        totalCategoryVal =
            foodVal + transVal + grocerryVal + healtVal + otherVal;
      },
    );
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'All Expenses',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start, 
            ),
          ),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/expencespage');
            },
            icon: Icon(
              Icons.arrow_back,
              size: 18,
            ),
          ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

                           
              ExpenceList(
                expenceList: _expenceList,
                onDeletedExpence: OnDeletedExpence,
              ),
            ],
          ),
        ),
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
    );
  }
}
