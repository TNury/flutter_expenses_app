import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/widgets/ui/modals/expense_creation_modal.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/navbar/navbar.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/expenses_list/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [];

  void _createExpense(Expense expense, [int index = 0]) {
    setState(() {
      _registeredExpenses.insert(index, expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _openExpenseAdditionOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) => ExpenseCreationModal(
        createExpense: _createExpense,
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: const Navbar(),
      backgroundColor: Colors.blue,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ExpensesList(
                expensesList: _registeredExpenses,
                removeExpense: _removeExpense,
                createExpense: _createExpense,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openExpenseAdditionOverlay,
        child: const Icon(
          Icons.add,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
