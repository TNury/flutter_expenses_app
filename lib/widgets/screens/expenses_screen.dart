import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/expenses_list/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      category: Category.study,
      amount: 19.99,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Groceries',
      category: Category.food,
      amount: 9.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.blue),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'The Chart',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Expanded(
                child: ExpensesList(_registeredExpenses),
              )
            ],
          ),
        ),
      ),
    );
  }
}
