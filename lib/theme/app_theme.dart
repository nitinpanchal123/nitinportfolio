import 'package:flutter/material.dart';

class AppColors {
  static const ink = Color(0xFF0B0A08);
  static const ink2 = Color(0xFF14120F);
  static const ink3 = Color(0xFF1C1914);
  static const paper = Color(0xFFF3EEE4);
  static const brass = Color(0xFFC9A36A);
  static const brass2 = Color(0xFFE4C98A);
  static const fog = Color(0xFF9A9184);
}

class AppTheme {
  static const display = 'InstrumentSerif';
  static const sans = 'Outfit';

  static ThemeData get dark {
    const base = TextTheme(
      displayLarge: TextStyle(
        fontFamily: display,
        fontSize: 56,
        height: 0.95,
        color: AppColors.paper,
      ),
      displayMedium: TextStyle(
        fontFamily: display,
        fontSize: 40,
        height: 0.98,
        color: AppColors.paper,
      ),
      headlineMedium: TextStyle(
        fontFamily: display,
        fontSize: 28,
        height: 1.05,
        color: AppColors.paper,
      ),
      titleLarge: TextStyle(
        fontFamily: display,
        fontSize: 22,
        height: 1.1,
        color: AppColors.paper,
      ),
      bodyLarge: TextStyle(
        fontFamily: sans,
        fontSize: 16,
        height: 1.55,
        color: AppColors.fog,
      ),
      bodyMedium: TextStyle(
        fontFamily: sans,
        fontSize: 14,
        height: 1.5,
        color: AppColors.fog,
      ),
      labelLarge: TextStyle(
        fontFamily: sans,
        fontSize: 13,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w500,
        color: AppColors.paper,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: sans,
      scaffoldBackgroundColor: AppColors.ink,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.ink2,
        primary: AppColors.brass,
        onPrimary: AppColors.ink,
        secondary: AppColors.brass2,
        onSurface: AppColors.paper,
      ),
      textTheme: base,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.paper,
      ),
    );
  }
}
