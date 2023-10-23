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
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Expense deleted.',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                scaffoldMessenger.removeCurrentSnackBar();

                createExpense(expense, index);
              },
              child: const Text(
                'Undo',
                style: TextStyle(
                  fontSize: 16,
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
          const Text(
            'Your expenses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (expensesList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: expensesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        key: ValueKey(expensesList[index]),
                        onDismissed: (_) {
                          _handleOnDismissed(
                              context, expensesList[index], index);
                        },
                        background: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
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
                      ),
                      // const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
          if (expensesList.isEmpty)
            const Center(
              child: Text(
                'Your list of expenses list is empty. Click the add button below to add a new expense.',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
