import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/theme/theme.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
      ),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: double.infinity,
          height: 200,
          // decoration: BoxDecoration(
          //   color: colorScheme.primary,
          // ),
        ),
      ),
    );
  }
}
