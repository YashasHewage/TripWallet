import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseData {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create a new expense
  Future<void> createExpense(ExpenseModel expense) {
    return _db.collection('expenses').doc(expense.id).set(expense.toFirestore());
  }

  // Get a single expense
  Future<ExpenseModel> getExpense(String id) async {
    var doc = await _db.collection('expenses').doc(id).get();
    return ExpenseModel.fromFirestore(doc);
  }

  // Get all expenses
  Future<List<ExpenseModel>> getExpenses() async {
    var snapshot = await _db.collection('expenses').get();
    return snapshot.docs.map((doc) => ExpenseModel.fromFirestore(doc)).toList();
  }

  // Update an expense
  Future<void> updateExpense(ExpenseModel expense) {
    return _db.collection('expenses').doc(expense.id).update(expense.toFirestore());
  }

  // Delete an expense
  Future<void> deleteExpense(String id) {
    return _db.collection('expenses').doc(id).delete();
  }
}

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  // Method to convert an instance into a map
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'amount': amount,
      'date': date,
      'category': category,
    };
  }

  // Factory constructor to create an instance from a Firestore document
  factory ExpenseModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ExpenseModel(
      id: doc.id,
      title: data['title'],
      amount: data['amount'],
      date: (data['date'] as Timestamp).toDate(),
      category: data['category'],
    );
  }
}