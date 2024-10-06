// lib/utils/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFFD8BFD8), // Lilac color
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFD8BFD8), // Lilac color for the app bar
      titleTextStyle: TextStyle(
          color: Colors.grey[800], fontSize: 20, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Colors.grey[200], // Light grey for the background
    textTheme: TextTheme(
      titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800]), // Updated from headline5
      bodyMedium: TextStyle(
          fontSize: 16, color: Colors.grey[600]), // Updated from bodyText2
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFD8BFD8), // Lilac color for FAB
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Color(0xFFD8BFD8)), // Secondary color
  );
}
