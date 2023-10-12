import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/theme/theme.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Flutter Expenses Tracker",
      theme: theme,
      home: const Scaffold(
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    ),
  );
}
