import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/generic/custom_snackbar.dart';
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
      CustomSnackbar(
        context: context,
        severity: Severity.error,
        text: 'Expense deleted.',
        actionButtonText: 'Undo',
        onActionButtonPress: () {
          scaffoldMessenger.removeCurrentSnackBar();

          createExpense(expense, index);
        },
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
