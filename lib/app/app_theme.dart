import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.yellow,
      hintColor: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Colors.yellow,
        secondary: Colors.red,
        background: Colors.white,
        surface: Colors.white,
        error: Colors.red,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.yellow,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
