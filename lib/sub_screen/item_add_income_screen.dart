import 'package:flutter/material.dart';
import 'package:money_management/widget/item_add.dart';

class ItemAddIncomeScreen extends StatefulWidget {
  const ItemAddIncomeScreen({super.key});

  @override
  State createState() {
    return ItemAddIncomeScreenState();
  }
}

class ItemAddIncomeScreenState extends State<ItemAddIncomeScreen> {
  int _index = -1;
  final List<String> _listTitle = [
    "Lương",
    "Khoản đầu tư",
    "Bán thời gian",
    "Giải thưởng",
    "Khác"
  ];
  final List<IconData> _listIcon = [
    Icons.add_card_outlined,
    Icons.currency_bitcoin_outlined,
    Icons.wallet_outlined,
    Icons.card_giftcard_outlined,
    Icons.account_balance_wallet_outlined
  ];

  @override
  void initState() {
    super.initState();
    _index = -1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: _listTitle.length,
          //   physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  if (_index != index) {
                    _index = index;
                  } else {
                    _index = -1;
                  }
                });
              },
              child:
                  itemAdd(_listIcon[index], _listTitle[index], _index == index),
            );
          }),
    );
  }
}
