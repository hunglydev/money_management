import 'package:flutter/material.dart';
import 'package:money_management/sub_screen/custom_keyboard.dart';

import '../constant/constant.dart';
import '../widget/item_add.dart';

class ItemAddCostScreen extends StatefulWidget {
  const ItemAddCostScreen({super.key});

  @override
  State createState() {
    return ItemAddCostScreenState();
  }
}

class ItemAddCostScreenState extends State<ItemAddCostScreen> {
  int _index = 0;
  final List<String> _title = [
    "Mua sắm",
    "Đồ ăn",
    "Điện thoại",
    "Giải trí",
    "Giáo dục",
    "Làm đẹp",
    "Thể thao",
    "Xã hội",
    "Giao thông",
    "Nhà ở",
    "Quần áo",
    "Điện nước",
    "Sức khỏe",
    "Du lịch",
    "Thú cưng",
    "Quyên góp"
  ];
  final List<IconData> _iconData = [
    Icons.shopping_cart_outlined,
    Icons.food_bank_outlined,
    Icons.phone_android,
    Icons.gamepad_outlined,
    Icons.school_outlined,
    Icons.school_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_baseball_outlined,
  ];

  @override
  void initState() {
    super.initState();
    _index = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: AppConst.paddingHorizontal),
      height: 500,
      child: GridView.builder(
          itemCount: _iconData.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10, crossAxisCount: 4),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    _index = index;
                    showModalBottomSheet(
                        isScrollControlled: false,
                        useSafeArea: true,
                        context: context,
                        builder: (context) => CustomKeyboard());
                  });
                },
                child:
                    itemAdd(_iconData[index], _title[index], _index == index));
          }),
    );
  }
}
