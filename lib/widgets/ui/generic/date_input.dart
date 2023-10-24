import 'package:flutter/material.dart';

import 'package:flutter_expenses_tracker/widgets/ui/generic/input.dart';

import 'package:flutter_expenses_tracker/utils/utils.dart';

class DateInput extends StatefulWidget {
  const DateInput({
    required this.labelText,
    required this.onSaved,
    this.validator,
    super.key,
  });

  final String labelText;
  final Function(DateTime?) onSaved;
  final String? Function(String?)? validator;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  final TextEditingController _dateTextController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();

    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      switchToInputEntryModeIcon: const Icon(null),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  onPrimary: Colors.white,
                  onSurface: Colors.white,
                  surfaceVariant: Colors.white,
                  onSurfaceVariant: Colors.white,
                  outline: Colors.white,
                  outlineVariant: Colors.white,
                ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                  titleSmall: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                ),
          ),
          child: child!,
        );
      },
    );

    if (chosenDate != null) {
      _dateTextController.value = TextEditingValue(
        text: dateFormatter.format(chosenDate),
      );

      setState(() {
        _selectedDate = chosenDate;
      });
    }
  }

  @override
  void dispose() {
    _dateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Input(
      labelText: widget.labelText,
      hintText: '07/01/2000',
      readOnly: true,
      controller: _dateTextController,
      suffixIcon: IconButton(
        onPressed: _presentDatePicker,
        icon: const Icon(
          Icons.calendar_month_outlined,
        ),
      ),
      onTap: _presentDatePicker,
      onSaved: (value) {
        widget.onSaved(_selectedDate);
      },
      validator: widget.validator,
    );
  }
}
