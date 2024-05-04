import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';

Widget itemAdd(IconData iconData, String title) {
  return Column(
    children: [
      Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColor.white),
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
