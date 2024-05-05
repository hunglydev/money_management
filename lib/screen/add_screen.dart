import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';
import 'package:money_management/sub_screen/item_add_cost_screen.dart';
import 'package:money_management/widget/item_add.dart';

class ShowBottomSheetAdd extends StatefulWidget {
  const ShowBottomSheetAdd({super.key});

  @override
  State createState() {
    return ShowBottomSheetStateAdd();
  }
}

class ShowBottomSheetStateAdd extends State<ShowBottomSheetAdd> {
  int _index = 0;
  final List<Widget> _subScreen = [
    const ItemAddCostScreen(),
    const ItemAddCostScreen(),
    const ItemAddCostScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppConst.border16),
              topLeft: Radius.circular(AppConst.border16))),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppConst.border16),
                    topLeft: Radius.circular(AppConst.border16))),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConst.paddingHorizontal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Hủy",
                          style: lightThemeData.textTheme.labelLarge,
                        ),
                      ),
                      Text(
                        "Thêm",
                        style: lightThemeData.textTheme.headlineMedium,
                      ),
                      Container(
                        width: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _index = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 30,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: _index == 0
                              ? AppColor.primaryColor
                              : AppColor.backgroundColor,
                        ),
                        child: Text(
                          "Chi phí",
                          style: TextStyle(
                            color:
                                _index == 0 ? AppColor.black : AppColor.black,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _index = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 30,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: _index == 1
                              ? AppColor.primaryColor
                              : AppColor.backgroundColor,
                        ),
                        child: Text(
                          "Thu nhập",
                          style: TextStyle(
                            color:
                                _index == 1 ? AppColor.black : AppColor.black,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _index = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 30,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: _index == 2
                              ? AppColor.primaryColor
                              : AppColor.backgroundColor,
                        ),
                        child: Text(
                          "Chuyển khoản",
                          style: TextStyle(
                            color:
                                _index == 2 ? AppColor.black : AppColor.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          _subScreen[_index],
        ],
      ),
    );
  }
}
