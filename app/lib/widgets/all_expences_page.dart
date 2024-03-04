// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/Models/expence.dart';
import 'package:app/widgets/add_new_expence.dart';
import 'package:app/widgets/expence_list.dart';
import 'package:flutter/material.dart';


class AllExpences extends StatefulWidget {
  const AllExpences({super.key});

  @override
  State<AllExpences> createState() => _AllExpencesState();
}

class _AllExpencesState extends State<AllExpences> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/expencespage');
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "All Expences",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              ExpenceList(
                expenceList: _expenceList,
                onDeletedExpence: OnDeletedExpence,
              ),
            ],
          ),
        ),
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
