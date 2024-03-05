import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = const TextTheme(
    titleLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
    bodySmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black54),
  );
  static TextTheme darkTextTheme = const TextTheme(
    titleLarge:  TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
    titleMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
    bodyLarge: TextStyle(
        fontSize: 13, fontWeight: FontWeight.w400, color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white70),
    bodySmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white70),
  );
}
