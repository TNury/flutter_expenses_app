import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/theme/theme.dart';
import 'package:flutter_expenses_tracker/theme/text_theme.dart';

final _darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
);

final ThemeData darkTheme = theme.copyWith(
  useMaterial3: true,

  colorScheme: _darkColorScheme,

  textTheme: textTheme(Colors.white),

  scaffoldBackgroundColor: _darkColorScheme.onSecondary,

  appBarTheme: theme.appBarTheme.copyWith(
    backgroundColor: _darkColorScheme.onSecondary,
    titleTextStyle: theme.appBarTheme.titleTextStyle!.copyWith(
      color: Colors.white,
    ),
  ),

  // Icon theme
  iconTheme: theme.iconTheme.copyWith(color: _darkColorScheme.primary),

  // Bottom sheet theme
  bottomSheetTheme: theme.bottomSheetTheme.copyWith(
    backgroundColor: _darkColorScheme.onSecondary,
    surfaceTintColor: _darkColorScheme.onSecondary,
  ),

  // Floating action button theme
  floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
    elevation: 2,
    backgroundColor: _darkColorScheme.primary,
    foregroundColor: Colors.white,
  ),

  // Input decoration theme
  inputDecorationTheme: theme.inputDecorationTheme.copyWith(
    fillColor: _darkColorScheme.secondaryContainer,
    border: getInputBorder(Colors.white),
    focusedBorder: getInputBorder(Colors.white),
    enabledBorder: getInputBorder(Colors.white),
    disabledBorder: getInputBorder(Colors.white),
    focusedErrorBorder: getInputBorder(Colors.white),
    errorBorder: getInputBorder(_darkColorScheme.error),
    hintStyle: theme.inputDecorationTheme.hintStyle!.copyWith(
      color: Colors.white24,
    ),
    // prefixStyle: const TextStyle(color: Colors.black),
    suffixIconColor: _darkColorScheme.primary,
  ),
);
