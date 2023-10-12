import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem(this.expenseData, {super.key});

  final Expense expenseData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expenseData.title,
                  style: const TextStyle(fontSize: 16),
                ),
                Icon(categoryIcons[expenseData.category]),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${expenseData.amount.toStringAsFixed(2)}'),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    const SizedBox(width: 8),
                    Text(expenseData.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
