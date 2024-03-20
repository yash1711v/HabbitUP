
import 'package:flutter/material.dart';

class MonthlyGridForEndDate extends StatefulWidget {
  final int monthIndex;

  const MonthlyGridForEndDate({super.key, required this.monthIndex});

  @override
  State<MonthlyGridForEndDate> createState() => _MonthlyGridForEndDateState();
}

class _MonthlyGridForEndDateState extends State<MonthlyGridForEndDate> {
  Set<int>? selectedDate = {};

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month + widget.monthIndex;
    final daysInMonth = DateTime(
        DateTime.now().year, int.parse((currentMonth + 1).toString()), 0)
        .day;

    final int firstDayIndex =
        (DateTime(DateTime.now().year, currentMonth, 1).weekday + 8) % 7;

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, // 7 columns for 7 days
          mainAxisExtent: 35),
      itemCount: daysInMonth + firstDayIndex,
      itemBuilder: (context, index) {
        if (index < firstDayIndex) {
          // Empty cell before the start of the month
          return Container();
        } else {
          // Calculate the day of the month
          final dayOfMonth = index - firstDayIndex + 1;
          return GestureDetector(
            onTap: () {
              // Update selected date and trigger repaint
              setState(() {
                selectedDate?.add(dayOfMonth);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 4.0, left: 15, right: 15, top: 4),
              child: Container(
                decoration: ShapeDecoration(
                    color: selectedDate!.contains(dayOfMonth)
                        ? const Color(0xFF9D6BCE)
                        : Colors.transparent,
                    shape: const OvalBorder(eccentricity: 0.1)),
                child: Center(
                  child: Text(
                    '$dayOfMonth',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge?.color,
                      // Example text color
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}