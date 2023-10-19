import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/widgets/ui/generic/input.dart';
import 'package:flutter_expenses_tracker/widgets/ui/generic/date_input.dart';

class ExpenseCreationModal extends StatefulWidget {
  const ExpenseCreationModal({
    required this.createExpense,
    super.key,
  });

  final Function(Expense expense) createExpense;

  @override
  State<ExpenseCreationModal> createState() => _ExpenseCreationModalState();
}

class _ExpenseCreationModalState extends State<ExpenseCreationModal> {
  final _formKey = GlobalKey<FormState>();
  final _formValues = {
    "title": "",
    "amount": 0,
    "category": Category.food,
    "date": null
  };
  String? _dateError;

  void _updateField(String fieldToUpdate, value) {
    setState(() {
      _formValues[fieldToUpdate] = value;
    });
  }

  void _updateDate(DateTime date) {
    setState(() {
      _formValues['date'] = date;

      if (_dateError != null) {
        _dateError = null;
      }
    });
  }

  void _submitForm() {
    if (_formValues['date'] == null) {
      setState(() {
        _dateError = 'Please insert a date.';
      });
    }

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DateInput(
                      date: _formValues['date'] != null
                          ? _formValues['date'] as DateTime
                          : null,
                      labelText: 'Date',
                      onChange: _updateDate,
                      error: _dateError,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _submitForm,
                  child: const Text('Create expense'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
