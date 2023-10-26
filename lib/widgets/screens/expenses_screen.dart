import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/widgets/ui/modals/expense_creation_modal.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/chart/chart.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/navbar/navbar.dart';
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
      title: 'Groceries',
      category: Category.food,
      amount: 100,
      date: DateTime.now(),
    ),
    Expense(
      title: 'New Desk',
      category: Category.work,
      amount: 200,
      date: DateTime.now(),
    ),
    Expense(
      title: 'California Trip 2',
      category: Category.travel,
      amount: 200,
      date: DateTime.now(),
    ),
    Expense(
      title: 'California Trip',
      category: Category.travel,
      amount: 1000,
      date: DateTime.now(),
    ),
    Expense(
      title: 'PS5',
      category: Category.leisure,
      amount: 400,
      date: DateTime.now(),
    ),
  ];

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

  Widget _buildBody() {
    if (_registeredExpenses.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chart(_registeredExpenses),
          const SizedBox(height: 48),
          Expanded(
            child: ExpensesList(
              expensesList: _registeredExpenses,
              removeExpense: _removeExpense,
              createExpense: _createExpense,
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Your list of expenses list is empty. Click the add button below to add a new expense.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: const Navbar(),
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _openExpenseAdditionOverlay,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
