import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/models/expense_bucket.dart';

class Chart extends StatelessWidget {
  const Chart(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

  @override
  Widget build(BuildContext context) {
    final double containerHeight =
        MediaQuery.of(context).size.height * 0.3; // 30% of the screen height

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: double.infinity,
          height: containerHeight,
        ),
      ),
    );
  }
}
