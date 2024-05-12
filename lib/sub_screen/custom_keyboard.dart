import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/widget/keyboard_button.dart';

class CustomKeyboard extends StatefulWidget {
  @override
  State createState() {
    return CustomKeyboardState();
  }
}

class CustomKeyboardState extends State<CustomKeyboard> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _total = TextEditingController();
  int currentNumber = 0;
  int previousNumber = 0;
  String? operation;

  @override
  void initState() {
    super.initState();
    _total.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppConst.paddingHorizontal, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.attach_money_rounded),
              Text(
                _total.text != "" ? _total.text : "0",
                style: fontKeyboardInput,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.backgroundColor,
            ),
            child: TextField(
              controller: _noteController,
              keyboardType: TextInputType.text,
              cursorColor: AppColor.primaryColor,
              decoration: InputDecoration(
                hintText: "Nhập vào ghi chú",
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chọn ngày: ",
                style: fontKeyboardInput,
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.backgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    Text("Hôm nay")
                  ],
                ),
              ),
              Container(
                width: 20,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customKeyboard(() => _onButtonTap("7"), "7"),
              customKeyboard(() => _onButtonTap("8"), "8"),
              customKeyboard(() => _onButtonTap("9"), "9"),
              customKeyboard(() => _onOperationTap("+"), "+"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customKeyboard(() => _onButtonTap("4"), "4"),
              customKeyboard(() => _onButtonTap("5"), "5"),
              customKeyboard(() => _onButtonTap("6"), "6"),
              customKeyboard(() => _onOperationTap("-"), "-"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customKeyboard(() => _onButtonTap("1"), "1"),
              customKeyboard(() => _onButtonTap("2"), "2"),
              customKeyboard(() => _onButtonTap("3"), "3"),
              customKeyboard(() => _onOperationTap("*"), "*"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customKeyboard(() => _onButtonTap("0"), "0"),
              InkWell(
                onTap: () {
                  setState(() {
                    if (_total.text.isNotEmpty) {
                      _total.text =
                          _total.text.substring(0, _total.text.length - 1);
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  color: AppColor.backgroundColor,
                  child: Icon(
                    Icons.cancel_presentation_rounded,
                    size: 20,
                  ),
                ),
              ),
              customKeyboard(() => _calculateResult(), "="),
              customKeyboard(() => _onOperationTap("/"), "/"),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.primaryColor,
              ),
              child: Text(
                "Nhập",
                style: titleButtonTextWithWhiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  _onButtonTap(String value) {
    setState(() {
      _total.text += value.toString();
    });
  }

  void _calculateResult() {
    setState(() {
      currentNumber = int.tryParse(_total.text) ?? 0;

      switch (operation) {
        case '+':
          _total.text = (previousNumber + currentNumber).toString();
          break;
        case '-':
          _total.text = (previousNumber - currentNumber).toString();
          break;
        case '*':
          _total.text = (previousNumber * currentNumber).toString();
          break;
        case '/':
          if (currentNumber != 0) {
            _total.text = (previousNumber / currentNumber).toString();
          } else {
            _total.text = "Error";
          }
          break;
        default:
          break;
      }
    });
  }

  void _onOperationTap(String op) {
    setState(() {
      previousNumber = int.tryParse(_total.text) ?? 0;
      operation = op;
      _total.clear();
    });
  }
}
