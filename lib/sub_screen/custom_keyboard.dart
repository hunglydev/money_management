import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';
import 'package:money_management/widget/keyboard_button.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({super.key});

  @override
  State createState() {
    return CustomKeyboardState();
  }
}

class CustomKeyboardState extends State<CustomKeyboard> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _total = TextEditingController();
  DateTime selectedDateTime = DateTime.now();
  int currentNumber = 0;
  int previousNumber = 0;
  String? operation;
  @override
  void initState() {
    super.initState();
    _total.text = "";
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialDate: selectedDateTime,
      builder: (context, child) {
        return Theme(
            data: lightThemeData
            //     .copyWith(
            //   primaryColor: AppColor.primaryColor,
            //   colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
            // ),
            ,
            child: child!);
      },
    ).then((value) => {
          setState(() {
            selectedDateTime = value!;
          })
        });
  }

  bool _compareDates(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConst.paddingHorizontal, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.attach_money_rounded),
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
              decoration: const InputDecoration(
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
              const Text(
                "Chọn ngày: ",
                style: fontKeyboardInput,
              ),
              InkWell(
                onTap: () {
                  _showDatePicker();
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.backgroundColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      Text(_compareDates(selectedDateTime, DateTime.now())
                          ? "Hôm nay"
                          : "${selectedDateTime.day} thg ${selectedDateTime.month} \n ${selectedDateTime.year} ")
                    ],
                  ),
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
          const SizedBox(
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
          const SizedBox(
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
          const SizedBox(
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
                  child: const Icon(
                    Icons.cancel_presentation_rounded,
                    size: 20,
                  ),
                ),
              ),
              customKeyboard(() => _calculateResult(), "="),
              customKeyboard(() => _onOperationTap("/"), "/"),
            ],
          ),
          const SizedBox(
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
              child: const Text(
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
