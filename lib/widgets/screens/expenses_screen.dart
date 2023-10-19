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

  void createExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openExpenseAdditionOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // shape: ,
      builder: (modalContext) => ExpenseCreationModal(
        createExpense: createExpense,
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
            const Text(
              'The Chart',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Expanded(
              child: ExpensesList(_registeredExpenses),
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
