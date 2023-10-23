import 'package:flutter/material.dart';

const _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(16),
  ),
);

UnderlineInputBorder _getInputBorder({Color borderColor = Colors.black}) {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      color: Colors.black,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
  );
}

final colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

final ThemeData theme = ThemeData(
  fontFamily: 'Poppins',
  // App-wide settings
).copyWith(
  useMaterial3: true,

  // Main color scheme
  colorScheme: colorScheme,

  scaffoldBackgroundColor: colorScheme.background,

  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: colorScheme.background,
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    // foregroundColor: colorScheme.primaryContainer,
  ),

  // Dialog theme
  dialogTheme: const DialogTheme().copyWith(
    shape: _roundedShape,
  ),

  // Icon theme
  iconTheme: const IconThemeData().copyWith(color: colorScheme.primary),

  // Bottom sheet theme
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  ),

  // Card theme
  cardTheme: const CardTheme().copyWith(
    elevation: 2,
    color: colorScheme.background,
    surfaceTintColor: colorScheme.background,
    shape: _roundedShape,
  ),

  // Filled button theme
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
      shape: MaterialStatePropertyAll(_roundedShape),
    ),
  ),

  // Floating action button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    elevation: 2,
    shape: _roundedShape,
    backgroundColor: colorScheme.primary,
    foregroundColor: Colors.white,
  ),

  // Input decoration theme
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    filled: true,
    contentPadding: const EdgeInsets.all(0),
    border: _getInputBorder(),
    focusedBorder: _getInputBorder(),
    errorBorder: _getInputBorder(borderColor: colorScheme.error),
    enabledBorder: _getInputBorder(),
    disabledBorder: _getInputBorder(),
    focusedErrorBorder: _getInputBorder(),
    hintStyle: const TextStyle(color: Colors.grey),
    prefixStyle: const TextStyle(color: Colors.black),
    errorStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
    ),
    suffixIconColor: colorScheme.primary,
  ),
);
