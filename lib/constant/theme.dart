import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';

final ThemeData lightThemeData = ThemeData(
  primaryColor: AppColor.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: AppColor.primaryColor,
    onPrimary: AppColor.white,
    secondary: AppColor.white,
    error: Colors.red,
    onError: Colors.red,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
        color: AppColor.black, fontSize: 25, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(
      color: AppColor.black,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
      color: AppColor.black,
      fontSize: 17,
    ),
  ),
);
