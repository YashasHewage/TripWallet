//create a uniqe id using uuid package
// ignore_for_file: non_constant_identifier_names

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
  Category.food: const     Color.fromARGB(255, 62, 141, 12),
  Category.transport: const Color.fromARGB(255, 255, 170, 42),
  Category.grocerry: const Color.fromARGB(255, 80, 200, 255),
  Category.health: const Color.fromARGB(255, 252, 46, 46),
  Category.other: const Color.fromARGB(255, 35, 81, 167),
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
