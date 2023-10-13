import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/expenses_list/expenses_list_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, {super.key});

  final List<Expense> expensesList;

  @override
  Widget build(context) {
    if (expensesList.isNotEmpty) {
      return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) => ExpensesListItem(
          expensesList[index],
        ),
      );
    } else {
      return const Center(
        child: Text(
          'Your list of expenses list is empty. Click the add button below to add a new expense.',
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
