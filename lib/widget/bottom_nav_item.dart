import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';

class BottomNavItem extends StatefulWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const BottomNavItem(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onTap,
      required this.isSelected});
  @override
  State createState() {
    return BottomNavItemState();
  }
}

class BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Icon(
            widget.iconData,
            color: widget.isSelected ? AppColor.primaryColor : Colors.black,
          ),
          Text(
            widget.title,
            style: TextStyle(
                color:
                    widget.isSelected ? AppColor.primaryColor : Colors.black),
          )
        ],
      ),
    ));
  }
}
