import 'package:flutter/material.dart';

TextTheme textTheme = ThemeData().textTheme.copyWith(
      // Titles
      titleSmall: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      titleMedium: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

      // Headlines
      headlineSmall: ThemeData().textTheme.headlineSmall!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      headlineMedium: ThemeData().textTheme.headlineMedium!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      headlineLarge: ThemeData().textTheme.headlineLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

      // Body texts
      bodySmall: ThemeData().textTheme.bodySmall!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
      bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
      bodyLarge: ThemeData().textTheme.bodyLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),

      // Label texts
      labelSmall: ThemeData().textTheme.labelSmall!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
      labelMedium: ThemeData().textTheme.labelMedium!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
      labelLarge: ThemeData().textTheme.labelLarge!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),

      // Display texts
      displaySmall: ThemeData().textTheme.displaySmall!.copyWith(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
      displayMedium: ThemeData().textTheme.displayMedium!.copyWith(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
      displayLarge: ThemeData().textTheme.displayLarge!.copyWith(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
    );
