import 'package:flutter/material.dart';

const inputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    width: 1.5,
    style: BorderStyle.solid,
    color: Colors.black,
  ),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(4),
    topRight: Radius.circular(4),
    bottomLeft: Radius.zero,
    bottomRight: Radius.zero,
  ),
);

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
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.blue),
      padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 4,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[300],
    contentPadding: const EdgeInsets.all(16),
    // hintText: 'john@doe.gmail.com',
    hintStyle: const TextStyle(color: Colors.grey),
    border: inputBorder,
    focusedBorder: inputBorder,
    errorBorder: inputBorder,
    enabledBorder: inputBorder,
    disabledBorder: inputBorder,
    focusedErrorBorder: inputBorder,
  ),
);
