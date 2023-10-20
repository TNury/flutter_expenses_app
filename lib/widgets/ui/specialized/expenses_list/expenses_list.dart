import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/expenses_list/expenses_list_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, this.removeExpense, {super.key});

  final List<Expense> expensesList;
  final void Function(Expense) removeExpense;

  @override
  Widget build(context) {
    if (expensesList.isNotEmpty) {
      return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(expensesList[index]),
            onDismissed: (_) {
              removeExpense(expensesList[index]);
            },
            background: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: const Center(
                child: Text(
                  "Delete expense",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            child: ExpensesListItem(
              expensesList[index],
            ),
          );
        },
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
