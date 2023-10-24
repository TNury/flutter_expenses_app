import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/theme/theme.dart';
import 'package:flutter_expenses_tracker/theme/dark_theme.dart';
import 'package:flutter_expenses_tracker/widgets/screens/expenses_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Flutter Expenses Tracker",
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const ExpensesScreen(),
    ),
  );
}
