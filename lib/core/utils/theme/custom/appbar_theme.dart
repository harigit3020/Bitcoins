import 'package:flutter/material.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  static AppBarTheme lightAppBar = const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  );

  static AppBarTheme darkAppBar = const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
