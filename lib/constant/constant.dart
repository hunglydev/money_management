import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color.fromRGBO(228, 92, 129, 1);
  static const Color backgroundColor = Color.fromRGBO(246, 211, 221, 1.0);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

class AppConst {
  static const double paddingHorizontal = 20;
  static const double border16 = 16;
}

const fontKeyboardButton = TextStyle(
  color: Colors.black,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);
const fontKeyboardInput = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);
const titleButtonTextWithWhiteColor = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w600,
);

const titleMedium = TextStyle(
  color: Colors.black,
  fontSize: 20,
);
const titleSmall = TextStyle(
  color: Colors.black,
  fontSize: 18,
);
const titleSmallWithColor = TextStyle(
  color: AppColor.primaryColor,
  fontSize: 18,
);
