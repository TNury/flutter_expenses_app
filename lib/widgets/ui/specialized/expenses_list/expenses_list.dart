import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/expenses_list/expenses_list_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expensesList,
    required this.removeExpense,
    required this.createExpense,
    super.key,
  });

  final List<Expense> expensesList;
  final void Function(Expense expense) removeExpense;
  final Function(Expense expense, [int index]) createExpense;

  void _handleOnDismissed(BuildContext context, Expense expense, int index) {
    removeExpense(expense);

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.clearSnackBars();

    scaffoldMessenger.showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(16),
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 2),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Expense deleted.',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
              ),
            ),
            TextButton(
              onPressed: () {
                scaffoldMessenger.removeCurrentSnackBar();

                createExpense(expense, index);
              },
              child: Text(
                'Undo',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your expenses',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expensesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Dismissible(
                      key: ValueKey(expensesList[index]),
                      onDismissed: (_) {
                        _handleOnDismissed(context, expensesList[index], index);
                      },
                      background: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Delete expense',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      child: ExpensesListItem(
                        expensesList[index],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
