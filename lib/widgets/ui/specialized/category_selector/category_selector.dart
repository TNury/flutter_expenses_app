import 'package:flutter/material.dart';

import 'package:flutter_expenses_tracker/models/expense.dart';
import 'package:flutter_expenses_tracker/utils/utils.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    required this.onSaved,
    super.key,
  });

  final Function(Category?) onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          itemHeight: 56,
          isExpanded: false,
          elevation: 4,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
            hintText: 'Food, travel, etc',
            hintStyle: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
              color: Colors.grey,
              fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          validator: (value) {
            if (value == null) {
              return 'Select the category';
            }

            return null;
          },
          selectedItemBuilder: (BuildContext context) {
            return Category.values.map((entry) {
              return Center(
                child: Text(
                  getCapitalizedString(entry.name),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }).toList();
          },
          items: Category.values.map((entry) {
            return DropdownMenuItem(
              value: entry,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  getCapitalizedString(entry.name),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }).toList(),
          onChanged: (test) {},
          onSaved: (newValue) {
            onSaved(newValue);
          },
        ),
      ],
    );
  }
}
