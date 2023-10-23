import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/theme/text_theme.dart';

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

final _colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

final ThemeData theme = ThemeData().copyWith(
  useMaterial3: true,

  // Main color scheme
  colorScheme: _colorScheme,

  scaffoldBackgroundColor: _colorScheme.background,

  textTheme: textTheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: _colorScheme.background,
    centerTitle: true,
    titleTextStyle: textTheme.titleSmall,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    // foregroundColor: _colorScheme.primaryContainer,
  ),

  // Dialog theme
  dialogTheme: const DialogTheme().copyWith(
    shape: _roundedShape,
  ),

  // Icon theme
  iconTheme: const IconThemeData().copyWith(color: _colorScheme.primary),

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
    elevation: 0,
    color: _colorScheme.background,
    surfaceTintColor: _colorScheme.background,
    shape: _roundedShape,
  ),

  // Filled button theme
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.all(16),
      shape: _roundedShape,
    ),
  ),

  // Floating action button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    elevation: 2,
    shape: _roundedShape,
    backgroundColor: _colorScheme.primary,
    foregroundColor: Colors.white,
  ),

  // Input decoration theme
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    filled: true,
    contentPadding: const EdgeInsets.all(0),
    border: _getInputBorder(),
    focusedBorder: _getInputBorder(),
    errorBorder: _getInputBorder(borderColor: _colorScheme.error),
    enabledBorder: _getInputBorder(),
    disabledBorder: _getInputBorder(),
    focusedErrorBorder: _getInputBorder(),
    hintStyle: const TextStyle(color: Colors.grey),
    prefixStyle: const TextStyle(color: Colors.black),
    errorStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
    ),
    suffixIconColor: _colorScheme.primary,
  ),
);
