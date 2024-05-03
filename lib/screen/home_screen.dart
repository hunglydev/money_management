import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            Text(
              "Sổ thu chi",
              style: lightThemeData.textTheme.headlineMedium,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month_outlined))
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingHorizontal),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("2024"), Text("Thg 4 ")],
              ),
              Text(
                "|",
                style: TextStyle(fontSize: 25),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Chi phí"), Text("0")],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Thu nhập"), Text("0")],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Số dư"), Text("0")],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 750,
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sticky_note_2_outlined,
                size: 100,
                color: Colors.grey,
              ),
              Text(
                "Chưa có dữ liệu",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
