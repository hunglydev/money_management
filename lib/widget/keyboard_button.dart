import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';

Widget customKeyboard(VoidCallback onTap, String title) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: 100,
      height: 40,
      color: AppColor.backgroundColor,
      child: Text(
        title,
        style: fontKeyboardButton,
      ),
    ),
  );
}
