import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/generic/custom_snackbar.dart';
import 'package:flutter_expenses_tracker/widgets/ui/generic/input.dart';
import 'package:flutter_expenses_tracker/widgets/ui/generic/date_input.dart';
import 'package:flutter_expenses_tracker/widgets/ui/specialized/category_selector/category_selector.dart';

class ExpenseCreationModal extends StatefulWidget {
  const ExpenseCreationModal({
    required this.createExpense,
    super.key,
  });

  final Function(Expense expense, [int index]) createExpense;

  @override
  State<ExpenseCreationModal> createState() => _ExpenseCreationModalState();
}

class _ExpenseCreationModalState extends State<ExpenseCreationModal> {
  final _formKey = GlobalKey<FormState>();
  final _formValues = {"title": "", "amount": 0, "category": null, "date": null};

  void _updateField(String fieldToUpdate, value) {
    setState(() {
      _formValues[fieldToUpdate] = value;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Expense expense = Expense(
        title: _formValues["title"] as String,
        category: _formValues['category'] as Category,
        amount: double.parse(_formValues['amount'] as String),
        date: _formValues['date'] as DateTime,
      );

      widget.createExpense(expense);

      Navigator.pop(context);

      final scaffoldMessenger = ScaffoldMessenger.of(context);

      scaffoldMessenger.showSnackBar(
        CustomSnackbar(
          context: context,
          severity: Severity.success,
          text: 'Expense created.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        // This handle the positioning of the modal when the keyboard is visible
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Input(
                  labelText: 'Title',
                  hintText: 'Groceries, PS5, etc...',
                  onSaved: (value) {
                    _updateField('title', value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please insert a title.';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Input(
                        type: TextInputType.number,
                        labelText: 'Amount',
                        hintText: '0.00',
                        prefixText: '\$',
                        onSaved: (value) {
                          _updateField('amount', value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please insert an amount.';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DateInput(
                        labelText: 'Date',
                        onSaved: (dateValue) {
                          if (dateValue != null) {
                            _updateField('date', dateValue);
                          }
                        },
                        validator: (formattedValue) {
                          if (formattedValue!.isEmpty) {
                            return 'Please pick a date.';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CategorySelector(
                  onSaved: (category) {
                    if (category != null) {
                      _updateField('category', category);
                    }
                  },
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Create Expense',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
