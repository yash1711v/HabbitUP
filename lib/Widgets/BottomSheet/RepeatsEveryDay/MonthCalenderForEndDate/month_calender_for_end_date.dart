import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Widgets/BottomSheet/RepeatsEveryDay/bottom_sheet_bloc.dart';

class MonthlyGridForEndDate extends StatelessWidget {
  final int monthIndex;

  const MonthlyGridForEndDate({super.key, required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month;
    List<int> daysInMonths = [
      31, // January
      28, // February
      31, // March
      30, // April
      31, // May
      30, // June
      31, // July
      31, // August
      30, // September
      31, // October
      30, // November
      31, // December
    ];

    final int firstDayIndex =
        (DateTime(DateTime.now().year, currentMonth + monthIndex, 1).weekday +
                8) %
            7;

    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      builder: (context, state) {
        if (state is RepeatCycleState) {
          endDate = state.endDate;
        }
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 7 columns for 7 days
              mainAxisExtent: 35),
          itemCount: daysInMonths[monthIndex] + firstDayIndex,
          itemBuilder: (context, index) {
            if (index < firstDayIndex) {
              // Empty cell before the start of the month
              return Container();
            } else {
              // Calculate the day of the month
              final dayOfMonth = index - firstDayIndex + 1;
              return GestureDetector(
                onTap: () {
                  endDate = formatDate(dayOfMonth, monthIndex+1, 2024);
                  print(endDate);
                  BlocProvider.of<BottomSheetBloc>(context)
                      .add(RepeatCycleEvent(
                    repeat: true,
                    onWhichDaysIfweeklu: DaysofWeek,
                    DatesForMonth: DatesForMonth,
                    setEndDate: true,
                    monthIndex: monthIndex+1,
                    endDate: endDate,
                    whichOption: whichOption,
                    Frequency: true,
                    numberPickervalue: frequencyNumber,

                  ));
                  // Update selected date and trigger repaint
                  // setState(() {
                  //   selectedDate?.add(dayOfMonth);
                  // });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 4.0, left: 15, right: 15, top: 4),
                  child: Container(
                    decoration: ShapeDecoration(
                        color: endDate == formatDate(dayOfMonth, monthIndex+1 , 2024)
                            ? const Color(0xFF9D6BCE)
                            : Colors.transparent,
                        shape: const OvalBorder(eccentricity: 0.1)),
                    child: Center(
                      child: Text(
                        '$dayOfMonth',
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
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
      },
    );
  }
}

String formatDate(int day, int month, int year) {
  String dayString = day < 10 ? '0$day' : '$day';
  String monthString = month < 10 ? '0$month' : '$month';
  return '$dayString-$monthString-$year';
}
