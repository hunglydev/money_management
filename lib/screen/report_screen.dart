import 'package:flutter/material.dart';
import 'package:money_management/constant/constant.dart';
import 'package:money_management/constant/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class ReportScreen extends StatefulWidget {
  @override
  State createState() {
    return ReportScreenState();
  }
}

class ReportScreenState extends State<ReportScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Text(
          "Lịch",
          style: lightThemeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2001, 1, 1),
            lastDay: DateTime(2030, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: AppColor.primaryColor,
              ),
              todayDecoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.6),
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return SizedBox(
                  width: 60,
                  child: Column(
                    children: [Text(day.day.toString()), Text("hehe")],
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return SizedBox(
                  width: 60,
                  child: Column(
                    children: [
                      Text(
                        focusedDay.day.toString(),
                      ),
                      Text("hehe")
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
