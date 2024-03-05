import 'package:bitcoins/core/utils/theme/custom/appbar_theme.dart';
import 'package:bitcoins/core/utils/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //Light Theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: CustomAppBarTheme.lightAppBar,
      brightness: Brightness.light,
      textTheme: AppTextTheme.lightTextTheme);

  //Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: CustomAppBarTheme.darkAppBar,
      brightness: Brightness.dark,
      textTheme: AppTextTheme.darkTextTheme);
}
