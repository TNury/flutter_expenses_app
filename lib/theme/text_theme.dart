import 'package:flutter/material.dart';

final textTheme = ThemeData().textTheme.copyWith(
      // Titles
      titleSmall: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      titleMedium: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
      titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),

      // Headlines
      headlineSmall: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      headlineMedium: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
      headlineLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),

      // Body texts
      bodySmall: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
      bodyMedium: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      bodyLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),

      // Label texts
      labelSmall: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
          ),
      labelMedium: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
          ),
      labelLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
          ),

      // Display texts
      displaySmall: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
          ),
      displayMedium: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
          ),
      displayLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
          ),
    );
