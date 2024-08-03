import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  static ThemeData get themeData {
    return ThemeData(
      indicatorColor: Colors.white,
      primaryColor: Colors.redAccent,
      primaryColorDark: Colors.black,
      primaryColorLight: Colors.white,
      primarySwatch: Colors.grey,
      //------
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //------
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      //------
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.blue),
        ),
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.sp,
        ),
        displayMedium: TextStyle(
          fontSize: 45.sp,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
        ),
        headlineMedium: TextStyle(
          fontSize: 32.sp,
        ),
        headlineSmall: TextStyle(
          fontSize: 28.sp,
        ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
        ),
        labelMedium: TextStyle(fontSize: 12.sp),
        labelSmall: TextStyle(
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
