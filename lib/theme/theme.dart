import 'package:flutter/material.dart';

const _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
);

UnderlineInputBorder _getInputBorder({Color borderColor = Colors.black}) {
  return const UnderlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
  );
}

final ThemeData theme = ThemeData(
  // App-wide settings
  useMaterial3: true,
  fontFamily: 'JetBrains Mono Regular',

  // Icon theme
  iconTheme: const IconThemeData(color: Colors.blueAccent),

  // Bottom sheet theme
  bottomSheetTheme: const BottomSheetThemeData(
    shape: _roundedShape,
  ),

  // Dialog theme
  dialogBackgroundColor: Colors.red,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),

  // Card theme
  cardTheme: const CardTheme(
    elevation: 4,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),

  // Filled button theme
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.blue),
      padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
      shape: MaterialStatePropertyAll(_roundedShape),
    ),
  ),

  // Floating action button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 4,
    backgroundColor: Colors.white,
    shape: _roundedShape,
  ),

  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[300],
    contentPadding: const EdgeInsets.all(0),
    border: _getInputBorder(),
    focusedBorder: _getInputBorder(),
    errorBorder: _getInputBorder(borderColor: Colors.red),
    enabledBorder: _getInputBorder(),
    disabledBorder: _getInputBorder(),
    focusedErrorBorder: _getInputBorder(),
    hintStyle: const TextStyle(color: Colors.grey),
    prefixStyle: const TextStyle(color: Colors.black),
    errorStyle: const TextStyle(
      fontSize: 16,
      color: Colors.red,
      height: 1.5,
    ),
  ),
);
