import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'JetBrains Mono Regular',
  iconTheme: const IconThemeData(color: Colors.blueAccent),
  cardTheme: const CardTheme(
    elevation: 4,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 4,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
);
