import 'package:flutter_expenses_tracker/models/expense.dart';

class ExpenseBucket {
  const ExpenseBucket({
    required this.expenses,
    this.category,
  });

  // // A named constructor for creating an ExpenseBucket for a specific category.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((entry) => entry.category == category).toList();

  final Category? category;
  final List<Expense> expenses;

  // Calculate the total expenses in the bucket.
  double get totalExpenses {
    double sum = 0;

    for (Expense expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
