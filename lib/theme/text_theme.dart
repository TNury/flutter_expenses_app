import 'package:flutter/material.dart';

TextTheme textTheme([Color? textColor]) {
  return ThemeData().textTheme.copyWith(
        // Titles
        titleSmall: ThemeData().textTheme.titleLarge!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        titleMedium: ThemeData().textTheme.titleLarge!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),

        // Headlines
        headlineSmall: ThemeData().textTheme.headlineSmall!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        headlineMedium: ThemeData().textTheme.headlineMedium!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
        headlineLarge: ThemeData().textTheme.headlineLarge!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),

        // Body texts
        bodySmall: ThemeData().textTheme.bodySmall!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
        bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
        bodyLarge: ThemeData().textTheme.bodyLarge!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),

        // Label texts
        labelSmall: ThemeData().textTheme.labelSmall!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
        labelMedium: ThemeData().textTheme.labelMedium!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
        labelLarge: ThemeData().textTheme.labelLarge!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),

        // Display texts
        displaySmall: ThemeData().textTheme.displaySmall!.copyWith(
              fontFamily: 'Poppins',
              color: textColor,
            ),
        displayMedium: ThemeData().textTheme.displayMedium!.copyWith(
              fontFamily: 'Poppins',
              color: textColor,
            ),
        displayLarge: ThemeData().textTheme.displayLarge!.copyWith(
              fontFamily: 'Poppins',
              color: textColor,
            ),
      );
}
