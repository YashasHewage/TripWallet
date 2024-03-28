// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/Models/expence.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(11),
                              bottomLeft: Radius.circular(11),
                              bottomRight: Radius.circular(11),
                              topRight: Radius.circular(11),
                              ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(),
                          child: TextField(
                            controller: _amountController,
                            decoration: InputDecoration(
                              hintText: "Enter Amount",
                              hintStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(11)), 
                              ),
                              filled: true, 
                              fillColor: Colors.white, 
                              suffix: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text('USD'), 
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
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
                padding: const EdgeInsets.symmetric(horizontal:20, ),
                child: Row(
                  children: [
                    Text(
                      "Select Category",
                      style: TextStyle(
                          color: Color(0xFF213660),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily), 
                    ),
                    Spacer(),
                    //date picker
                    Container(
                      margin: EdgeInsets.only(top: 1), 
                      child: Row(
                        children: [
                          Text(
                            formatteDate.format(_selectedDate),
                            style: TextStyle(
                                color: Color.fromARGB(255, 32, 32, 32),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.poppins().fontFamily),
                          ),
                          IconButton(
                            onPressed: _openDateModal,
                            icon: Icon(Icons.date_range_outlined),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0), 
              child: Builder(builder: (context) {
                return Center(
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 15.0,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCategoryButton("Food", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)),
                          SizedBox(width: 10.0),
                          buildCategoryButton("Transport", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)),
                          SizedBox(width: 10.0),
                          buildCategoryButton("Grocery", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)),
                          SizedBox(width: 10.0),
                          buildCategoryButton("Health", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)),
                          SizedBox(width: 10.0),
                          buildCategoryButton("Other", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                //title text field
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:10),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        hintText: " Title",
                        hintStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20, 
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 43, 43), 
                        ),
                      border: InputBorder.none, 
                      fillColor: Colors.white, 
                      filled: true, 
                    ),
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.red,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            //save button
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _handleFormSubmit,
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                        fontSize: 18, 
                        color: Colors.blue,
                      ),
                    ),
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
  }Widget buildCategoryButton(String categoryName, {required TextStyle style}) {
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
                color: isSelected ? Color.fromARGB(255, 33, 143, 233) : color,
                width: isSelected ? 4 : 1,
              ),
            ),
            child: CircleAvatar(
              backgroundColor:color,
              radius: 25.0, 
              child: Icon(icon, color: Colors.white, size: 20), 
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            categoryName.toUpperCase(),
            style: TextStyle(
              color: isSelected ? Color.fromARGB(255, 33, 143, 233) : Color.fromARGB(255, 39, 39, 39),
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
