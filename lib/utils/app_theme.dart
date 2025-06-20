import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFF1E1E1E),
    hintColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
      titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    dividerColor: const Color(0xFF2A2A2A),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF252525),
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1E1E1E),
      secondary: Color(0xFF00C853),
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      background: Color(0xFF121212),
    ),
  );

  static const Color green = Color(0xFF00FF85);
  static const Color red = Color(0xFFFF4D4D);
  static const Color textGray = Color(0xFF8A8A8A);
  static const Color borderGray = Color(0xFF333333);
  static const Color background = Color(0xFF131313);
  static const Color cardBackground = Color(0xFF1A1A1A);
  static const Color buttonBackground = Color(0xFF2C2C2C);
  static const Color darkGrey = Color(0xFF252525);
}
