import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';

Widget itemAdd(IconData iconData, String title, bool isSelected) {
  return Column(
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColor.primaryColor : AppColor.white),
        child: Icon(iconData),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        title,
        style: lightThemeData.textTheme.bodyLarge,
      )
    ],
  );
}
