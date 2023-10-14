import 'package:flutter/material.dart';

const _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
);

UnderlineInputBorder _getInputBorder({Color borderColor = Colors.black}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: borderColor,
    ),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
      bottomLeft: Radius.zero,
      bottomRight: Radius.zero,
    ),
  );
}

final ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'JetBrains Mono Regular',
  iconTheme: const IconThemeData(color: Colors.blueAccent),
  bottomSheetTheme: const BottomSheetThemeData(
    shape: _roundedShape,
  ),
  cardTheme: const CardTheme(
    elevation: 4,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.blue),
      padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
      shape: MaterialStatePropertyAll(_roundedShape),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 4,
    backgroundColor: Colors.white,
    shape: _roundedShape,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[300],
    contentPadding: const EdgeInsets.all(16),
    // hintText: 'john@doe.gmail.com',
    border: _getInputBorder(),
    focusedBorder: _getInputBorder(),
    errorBorder: _getInputBorder(borderColor: Colors.red),
    enabledBorder: _getInputBorder(),
    disabledBorder: _getInputBorder(),
    focusedErrorBorder: _getInputBorder(),
    hintStyle: const TextStyle(color: Colors.grey),
    prefixStyle: const TextStyle(color: Colors.black),
    errorStyle: const TextStyle(fontSize: 16),
  ),
);
