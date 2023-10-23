import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem(this.expenseData, {super.key});

  final Expense expenseData;

  Color getIconBackground(BuildContext context) {
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
        return Theme.of(context).colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: getIconBackground(context),
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
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${expenseData.amount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            expenseData.formattedDate,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.date_range),
                        ],
                      )
                    ],
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
