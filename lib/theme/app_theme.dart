import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00BFA5);
  static const Color secondaryColor = Color(0xFF1DE9B6);
  static const Color dangerColor = Color(0xFFFF5252);
  static const Color warningColor = Color(0xFFFFD740);
  static const Color successColor = Color(0xFF69F0AE);
  static const Color darkBg = Color(0xFF0D1117);
  static const Color darkCard = Color(0xFF161B22);
  static const Color darkSurface = Color(0xFF21262D);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: darkCard,
        error: dangerColor,
      ),
      scaffoldBackgroundColor: darkBg,
      cardTheme: CardTheme(
        color: darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBg,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkCard,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white60),
        labelSmall: TextStyle(color: Colors.white38, letterSpacing: 1.2),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    );
  }
}
