import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

final _datePickerStyles = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
);

class DateInput extends StatefulWidget {
  const DateInput({
    required this.labelText,
    this.date,
    this.error,
    required this.onChange,
    super.key,
  });

  final String labelText;
  final DateTime? date;
  final String? error;
  final Function(DateTime) onChange;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  @override
  void initState() {
    super.initState();
  }

  String get _formatedDate {
    int day = widget.date!.day;
    int month = widget.date!.month;
    int year = widget.date!.year;

    return '$day/$month/$year';
  }

  void _presentDatePicker() async {
    final now = DateTime.now();

    final firstDate = DateTime(now.year - 1, now.month, now.day);

    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: _datePickerStyles,
          child: child!,
        );
      },
    );

    if (chosenDate != null) {
      widget.onChange(chosenDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            _presentDatePicker();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.date != null ? _formatedDate : '11/12/23',
                      style: TextStyle(
                        fontSize: 16,
                        color: widget.date != null ? Colors.black : Colors.grey,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(16),
                      onPressed: () {
                        _presentDatePicker();
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
              if (widget.error != null)
                // The animation here is just to replicate
                // the default animation flutter has for showing error messages
                Animate(
                  effects: const [
                    FadeEffect(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 75),
                    ),
                    SlideEffect(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 75),
                    )
                  ],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      widget.error as String,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
