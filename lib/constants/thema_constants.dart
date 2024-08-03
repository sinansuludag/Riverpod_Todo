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
      dialogBackgroundColor: Colors.white,
      //------
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.grey.shade100,
      ),
      //------
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.redAccent.shade700,
        elevation: 4,
      ),
      //------
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      //------
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'EduAUVICWANTHand',
      //------
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //------
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.red.shade600,
      ),
      //------
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      //------
      snackBarTheme: SnackBarThemeData(backgroundColor: Colors.red.shade400),
      //------
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.blue),
        ),
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.sp,
        ), // Büyük başlık
        displayMedium: TextStyle(
          fontSize: 45.sp,
        ), // Orta başlık
        displaySmall: TextStyle(
          fontSize: 36.sp,
        ), // Küçük başlık
        headlineMedium: TextStyle(
          fontSize: 32.sp,
        ), // Orta başlık
        headlineSmall: TextStyle(
          fontSize: 28.sp,
        ), // Küçük başlık
        titleLarge: TextStyle(
          fontSize: 22.sp,
        ), // Başlık
        titleMedium: TextStyle(
          fontSize: 16.sp,
        ), // Orta başlık
        titleSmall: TextStyle(
          fontSize: 14.sp,
        ), // Küçük başlık
        bodyLarge: TextStyle(
          fontSize: 16.sp,
        ), // Büyük gövde metni
        bodyMedium: TextStyle(
          fontSize: 14.sp,
        ), // Orta gövde metni
        bodySmall: TextStyle(
          fontSize: 12.sp,
        ), // Küçük gövde metni
        labelLarge: TextStyle(
          fontSize: 14.sp,
        ), // Etiket
        labelMedium: TextStyle(fontSize: 12.sp), // Orta etiket
        labelSmall: TextStyle(
          fontSize: 11.sp,
        ), // Küçük etiket
      ),
    );
  }
}
