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
  void initState() {
    super.initState();
  }

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
                      onTap: () => _selectYears(),
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

  Future<void> _selectYears() async {
    int? selectYears;
    final List<int> years =
        List<int>.generate(50, (index) => DateTime.now().year - 25 + index);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Hủy",
              style: titleSmallWithColor,
            ),
          ),
        ],
        title: const Text(
          "Chọn năm",
          style: titleMedium,
        ),
        content: SizedBox(
          width: 300,
          height: 200,
          child: GridView.builder(
            itemCount: years.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedYear = years[index];
                    selectYears = years[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: years[index] == _selectedYear
                        ? AppColor.primaryColor
                        : Colors.transparent,
                  ),
                  child: Text(
                    years[index].toString(),
                    style: titleSmall.copyWith(
                      color: years[index] == _selectedYear
                          ? AppColor.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
    if (selectYears != 0) {
      await _selectMonths();
    }
  }

  Future<void> _selectMonths() async {
    final List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Hủy",
              style: titleSmallWithColor,
            ),
          ),
        ],
        title: const Text(
          "Chọn tháng",
          style: titleMedium,
        ),
        content: SizedBox(
          width: 300,
          height: 200,
          child: GridView.builder(
            itemCount: months.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedMonth = months[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: months[index] == _selectedMonth
                        ? AppColor.primaryColor
                        : Colors.transparent,
                  ),
                  child: Text(
                    "Thg ${months[index]}",
                    style: titleSmall.copyWith(
                      color: months[index] == _selectedMonth
                          ? AppColor.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
