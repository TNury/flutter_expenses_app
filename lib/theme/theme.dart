import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/theme/text_theme.dart';

const roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(16),
  ),
);

UnderlineInputBorder getInputBorder([Color borderColor = Colors.white]) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      color: borderColor,
    ),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
  );
}

final _colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
  primary: Colors.blue,
);

final ThemeData theme = ThemeData().copyWith(
  useMaterial3: true,

  // Main color scheme
  colorScheme: _colorScheme,

  scaffoldBackgroundColor: _colorScheme.onSecondary,

  textTheme: textTheme,
  appBarTheme: const AppBarTheme().copyWith(
    scrolledUnderElevation: 0,
    backgroundColor: _colorScheme.onSecondary,
    centerTitle: true,
    titleTextStyle: textTheme.titleSmall,
  ),

  // Dialog theme
  dialogTheme: const DialogTheme().copyWith(
    shape: roundedShape,
  ),

  // Icon theme
  iconTheme: const IconThemeData().copyWith(color: _colorScheme.primary),

  // Bottom sheet theme
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    backgroundColor: _colorScheme.onSecondary,
    surfaceTintColor: _colorScheme.onSecondary,
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
    color: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),

  // Filled button theme
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.all(16),
      shape: roundedShape,
      backgroundColor: _colorScheme.primary,
      textStyle: textTheme.bodyMedium,
    ),
  ),

  // Floating action button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    elevation: 2,
    shape: roundedShape,
    backgroundColor: _colorScheme.primary,
    foregroundColor: Colors.white,
  ),

  // Input decoration theme
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    filled: true,
    contentPadding: const EdgeInsets.all(0),
    border: getInputBorder(),
    focusedBorder: getInputBorder(),
    errorBorder: getInputBorder(_colorScheme.error),
    enabledBorder: getInputBorder(),
    disabledBorder: getInputBorder(),
    focusedErrorBorder: getInputBorder(),
    hintStyle: const TextStyle(
      color: Colors.white24,
    ),
    prefixStyle: const TextStyle(color: Colors.white),
    errorStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
    ),
    suffixIconColor: _colorScheme.primary,
  ),
);
