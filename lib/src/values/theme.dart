import 'package:flutter/material.dart';

// To enhance readability, separated the theme from the main file.
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: textTheme,
);

const textTheme = TextTheme(
  bodyLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
  ),
);

// Created a TextTheme extension to incorporate a new custom style for error text.
extension TextThemeExtension on TextTheme {
  TextStyle get errorText => const TextStyle(
        color: Colors.red,
        fontSize: 14,
      );
}
