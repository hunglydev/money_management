import 'package:flutter/material.dart';

import 'package:money_management/constant/theme.dart';
import 'package:money_management/screen/dashboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Scaffold(body: Dashboard()),
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
    ),
  );
}
