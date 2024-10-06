// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import the SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default theme mode
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      // Toggle between light and dark mode
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookNest',
      theme: ThemeData(
        primaryColor: Colors.pink[300], // Softer pink for the primary color
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Colors.pink[300]!, // Ensure non-null with '!'
          secondary: Colors.purple,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink[200]!, // Ensure non-null with '!'
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black54),
          titleMedium: TextStyle(
              color: Colors.pink[300]!,
              fontSize: 20,
              fontWeight: FontWeight.bold), // Ensure non-null with '!'
        ),
      ),
      darkTheme: ThemeData(
        primaryColor:
            Colors.pink[700]!, // Use a consistent darker shade of pink
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary:
              Colors.pink[700]!, // Use the dark pink, ensure non-null with '!'
          secondary: Colors.purple[300]!,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink[
              800]!, // Darker pink for the AppBar in dark mode, ensure non-null with '!'
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleMedium: TextStyle(
              color: Colors.pink[300]!,
              fontSize: 20,
              fontWeight: FontWeight.bold), // Ensure non-null with '!'
        ),
      ),
      themeMode: _themeMode,
      home: SplashScreen(
          onThemeToggle:
              _toggleTheme), // Pass the toggle function to SplashScreen
    );
  }
}
