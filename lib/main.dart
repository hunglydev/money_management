import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';
import 'package:money_management/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: AppColor.backgroundColor, body: HomeScreen()),
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
    ),
  );
}
