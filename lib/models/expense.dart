import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/utils/utils.dart';

enum Category { food, travel, leisure, work, study }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.study: Icons.menu_book
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
