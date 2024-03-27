// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/Models/expence.dart';
import 'package:flutter/material.dart';
 
class AddNewExpence extends StatefulWidget {
  final void Function(ExpenceModel expence) onAddExpence;
  const AddNewExpence({
    super.key,
    required this.onAddExpence,
  });

  @override
  State<AddNewExpence> createState() => _AddNewExpenceState();
}

class _AddNewExpenceState extends State<AddNewExpence> {
  Category? selectedCategory;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

//date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedDate = DateTime.now();
  //date picker
  Future<void> _openDateModal() async {
    try {
      final pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate);
      setState(() {
        _selectedDate = pickedDate!;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  // handle form submit
  void _handleFormSubmit() {
    //convert the amount in to a double
    final userAmount = double.parse(_amountController.text.trim());
    if (_titleController.text.trim().isEmpty ||
        userAmount <= 0 ||
        selectedCategory == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Invalid Input"),
            content: Text("Please enter valid date and amount"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    } else {
      // creat the new expence
      ExpenceModel newExpence = ExpenceModel(
          title: _titleController.text.trim(),
          amount: userAmount,
          date: _selectedDate,
          category: selectedCategory!);
      widget.onAddExpence(newExpence);
      Navigator.pop(context);
    }
  }

  //dispose
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Center(
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFFE5EFFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              bottomLeft: Radius.circular(80),
                              bottomRight: Radius.circular(80)),
                        ),
                        //amount text field
                        child: TextField(
                          controller: _amountController,
                          decoration: InputDecoration(
                            hintText: "Enter Amount ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(80),
                                  bottomLeft: Radius.circular(80),
                                  bottomRight: Radius.circular(80)),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(5),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('LKR'),
                              )

                              // Image.asset(
                              //   "assets/lkr.png",
                              //   width: 50,
                              //   height: 50,
                              // ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      "Select Category",
                      style: TextStyle(
                          color: Color(0xFF213660),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    //date picker
                    Row(
                      children: [
                        Text(
                          formatteDate.format(_selectedDate),
                          style: TextStyle(
                              color: Color(0xFF213660),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: _openDateModal,
                          icon: Icon(Icons.date_range_outlined),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Builder(builder: (context) {
              return Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 15.0,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCategoryButton("Food"),
                        SizedBox(width: 20.0),
                        buildCategoryButton("Transport"),
                        SizedBox(width: 20.0),
                        buildCategoryButton("Grocery"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCategoryButton("Health"),
                        SizedBox(width: 20.0),
                        buildCategoryButton("Other"),
                      ],
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  color: Color(0xFFE5EFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                //title text field
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: "Add new expences title ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            //save button
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _handleFormSubmit,
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(String categoryName) {
    Category category = getCategoryFromString(categoryName);
    IconData icon = CategoryIcons[category]!;
    Color color = CategoryColor[category]!;
    bool isSelected = selectedCategory == category;

    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Color(0xFF213660) : color,
                width: isSelected ? 6.0 : 1.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor:color,
              radius: 30.0,
              child: Icon(icon, color: Colors.white, size: 30.0),
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            categoryName.toUpperCase(),
            style: TextStyle(
              color: isSelected ? Colors.blue : Color(0xFF213660),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Category getCategoryFromString(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case "food":
        return Category.food;
      case "transport":
        return Category.transport;
      case "grocery":
        return Category.grocerry;
      case "health":
        return Category.health;
      case "other":
        return Category.other;
      default:
        return Category.other;
    }
  }
}
