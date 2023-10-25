import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/utils/utils.dart';

enum Category { food, travel, leisure, work, study }

const categoryIcons = {
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.leisure: Icons.movie_outlined,
  Category.work: Icons.work,
  Category.study: Icons.menu_book_outlined
};

Map<Category, Color> categoryColors = {
  Category.food: Colors.green,
  Category.travel: Colors.orange,
  Category.leisure: Colors.pink,
  Category.work: Colors.blue,
  Category.study: Colors.purple,
};

class Expense {
  Expense({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final Category category;
  final double amount;
  final DateTime date;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
