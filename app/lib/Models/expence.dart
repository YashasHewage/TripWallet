//create a uniqe id using uuid package
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();
//date formater
final formatteDate = DateFormat.yMd();

//enum
enum Category { food, transport, grocerry, health, other }

// category icons
final CategoryIcons = {
  Category.food: Icons.restaurant,
  Category.transport: Icons.emoji_transportation_rounded,
  Category.grocerry: Icons.local_grocery_store,
  Category.health: Icons.healing,
  Category.other: Icons.wallet,
};
//category color
final CategoryColor = {
  Category.food: Colors.green[900],
  Category.transport: Colors.yellow[800],
  Category.grocerry: Colors.lightBlue[300],
  Category.health: Colors.red[900],
  Category.other: Colors.blueAccent[200],
};

class ExpenceModel {
  //constructor
  ExpenceModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //getter formater
  String get getFormatedDate {
    return formatteDate.format(date);
  }
}
