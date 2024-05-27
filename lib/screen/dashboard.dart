import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/screen/add_screen.dart';
import 'package:money_management/screen/home_screen.dart';
import 'package:money_management/screen/report_screen.dart';
import 'package:money_management/widget/bottom_nav_item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  int _pageIndex = 0;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
    pageController = PageController(initialPage: 0);
  }

  final List<Widget> _screen = [
    const HomeScreen(),
    const HomeScreen(),
    ReportScreen(),
    const HomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        color: AppColor.backgroundColor,
        child: Row(
          children: [
            BottomNavItem(
                iconData: Icons.home,
                title: "Trang chủ",
                onTap: () => _setPage(0),
                isSelected: _pageIndex == 0),
            BottomNavItem(
                iconData: Icons.pie_chart_outline,
                title: "Biểu đồ",
                onTap: () => _setPage(1),
                isSelected: _pageIndex == 1),
            Expanded(child: Container()),
            BottomNavItem(
                iconData: Icons.insert_drive_file_outlined,
                title: "Báo cáo",
                onTap: () => _setPage(2),
                isSelected: _pageIndex == 2),
            BottomNavItem(
                iconData: Icons.person_2_outlined,
                title: "Tôi",
                onTap: () => _setPage(3),
                isSelected: _pageIndex == 3),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            showModalBottomSheet(
                useSafeArea: true,
                context: context,
                isScrollControlled: true,
                builder: (context) =>
                    const SingleChildScrollView(child: ShowBottomSheetAdd()));
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: PageView.builder(
          controller: pageController,
          itemCount: _screen.length,
          itemBuilder: (context, index) {
            return _screen[index];
          }),
    );
  }

  void _setPage(int index) {
    setState(() {
      pageController!.jumpToPage(index);
      _pageIndex = index;
    });
  }
}
