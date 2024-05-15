import 'package:flutter/material.dart';
import 'package:money_management/constant/theme.dart';
import 'package:money_management/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedMonth = DateTime.now().month;
  int _selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColor.primaryColor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => _selectMonth(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_selectedYear.toString()),
                          Text(
                            "Thg $_selectedMonth",
                            style: titleMedium,
                          )
                        ],
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Chi phí"), Text("0")],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Thu nhập"), Text("0")],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Số dư"), Text("0")],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 700,
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

  Future<void> _selectMonth() async {
    final List<int> years =
        List<int>.generate(50, (index) => DateTime.now().year - 25 + index);

    int tempSelectedMonth = _selectedMonth;
    int tempSelectedYear = _selectedYear;
    bool selectingYear = true;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: selectingYear
                  ? const Text('Chọn năm')
                  : Text('Chọn tháng - $tempSelectedYear'),
              content: selectingYear
                  ? SingleChildScrollView(
                      child: Column(
                        children: years.map((year) {
                          return ListTile(
                            title: Text(year.toString()),
                            onTap: () {
                              setState(() {
                                tempSelectedYear = year;
                                selectingYear = false;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: List.generate(12, (index) {
                          int month = index + 1;
                          return ListTile(
                            title: Text('Tháng $month'),
                            onTap: () {
                              setState(() {
                                tempSelectedMonth = month;
                              });
                              Navigator.of(context).pop();
                            },
                          );
                        }),
                      ),
                    ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (selectingYear) {
                      Navigator.of(context).pop();
                    } else {
                      setState(() {
                        selectingYear = true;
                      });
                    }
                  },
                  child: Text(selectingYear ? 'Hủy' : 'Trở lại'),
                ),
                if (!selectingYear)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedMonth = tempSelectedMonth;
                        _selectedYear = tempSelectedYear;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
