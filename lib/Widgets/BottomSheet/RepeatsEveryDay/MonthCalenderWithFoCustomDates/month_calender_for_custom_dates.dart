
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:intl/intl.dart';

import '../bottom_sheet_bloc.dart';

class MonthlyGridView extends StatelessWidget {
  final int monthIndex;

  const MonthlyGridView({super.key, required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month ;

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
        (DateTime(DateTime.now().year, currentMonth+monthIndex, 1).weekday + 8) % 7;

    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      builder: (context, state) {
        if(state is MonthChangeState){
          datesOnwhichTheHabbitsAreSet=state.Datesare;
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
                  // Update selected date and trigger repaint
                  if(datesOnwhichTheHabbitsAreSet.containsKey(DateFormat.MMMM().format(DateTime(2024, monthIndex+1)).toString())){
                    if(datesOnwhichTheHabbitsAreSet[DateFormat.MMMM().format(DateTime(2024, monthIndex+1)).toString()]!.contains(dayOfMonth)){
                      datesOnwhichTheHabbitsAreSet[DateFormat.MMMM().format(DateTime(2024, monthIndex+1)).toString()]!.remove(dayOfMonth);
                    }else{
                      datesOnwhichTheHabbitsAreSet[DateFormat.MMMM().format(DateTime(2024, monthIndex+1)).toString()]!.add(dayOfMonth);

                    }
                  }else{
                    datesOnwhichTheHabbitsAreSet.putIfAbsent(DateFormat.MMMM().format(DateTime(2024, monthIndex+1)).toString(), () => {dayOfMonth});
                  }
                  BlocProvider.of<BottomSheetBloc>(context).add(MothChangeEvent(monthIndex: monthIndex+1, Datesare: datesOnwhichTheHabbitsAreSet));

                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 4.0, left: 15, right: 15, top: 4),
                  child: Container(
                    decoration: ShapeDecoration(
                        color: datesOnwhichTheHabbitsAreSet[ DateFormat.MMMM().format(
                            DateTime(2024, monthIndex+1)).toString()]!.contains(dayOfMonth)
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
      },
    );
  }
}

String whichOption2({required String optionName}) {
  if (optionName == "Daily") {
    return "Day";
  } else if (optionName == "Weekly") {
    return "Week";
  } else {
    return "Month";
  }
}