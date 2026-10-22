import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;

  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontWeight: .w600, fontSize: 28),
      titleMedium: TextStyle(color: Colors.black, fontWeight: .w600, fontSize: 20),
      labelLarge: TextStyle(color: Colors.grey, fontWeight: .w400,fontSize: 20),
    ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: .only(left: 12),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.themeColor),),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.themeColor, width: 2),),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent, width: 2),),
        border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.themeColor),),

  ),
  );

  static final ThemeData _darkThemeData = ThemeData(
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    )
  );
}