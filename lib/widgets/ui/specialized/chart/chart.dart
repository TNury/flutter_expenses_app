import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerHeight =
        MediaQuery.of(context).size.height * 0.3; // 30% of the screen height

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: double.infinity,
          height: containerHeight,
        ),
      ),
    );
  }
}
