import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';

import 'package:flutter_expenses_tracker/theme/theme.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem(this.expenseData, {super.key});

  final Expense expenseData;

  Color get iconBackground {
    switch (expenseData.category) {
      case Category.food:
        return Colors.green;
      case Category.leisure:
        return Colors.indigo;
      case Category.travel:
        return Colors.cyan;
      case Category.study:
        return Colors.purple;
      default:
        return colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: iconBackground,
              ),
              child: Icon(
                categoryIcons[expenseData.category],
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          expenseData.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          Text(
                            expenseData.formattedDate,
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.date_range),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '\$${expenseData.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
