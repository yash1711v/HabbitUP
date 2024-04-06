import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Progress/progress_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:habitup/Widgets/DialogBox/MonthPickerDialogBox/month_picker_dialog_box.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as Math;

import '../Routine/SubScreens/stacking_cards.dart';
import 'Graph/bar_chart.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int weekNumber = _getWeekNumber(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userhabitScreenController.UserHabit.value);
    BlocProvider.of<ProgressBloc>(context)
        .add(Progresschangeevent(userhabitScreenController.UserHabit.value));
    print(weekNumber);
  }




  @override
  Widget build(BuildContext context) {
    contextProgress = context;
    BlocProvider.of<ProgressBloc>(context)
        .add(Progresschangeevent(userhabitScreenController.UserHabit.value));
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 210,
              child: Text(
                'Today’s progress',
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium?.color,
                  fontSize: 26,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            BlocBuilder<ProgressBloc, ProgressState>(
              builder: (context, state) {
                Map<String, dynamic> Habits = {};
                Set<String> nameOfHabits = {};
                int progress = 0;
                if (state is Progressstate) {
                  Habits = TotalNumberOfmethods(
                      userhabitScreenController.UserHabit.value);

                  nameOfHabits = Habitsname().toSet();
                  progress = todatsProgress(Habits);


                }
                return Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text(
                    '$progress%',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 40,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      duration: const Duration(milliseconds: 700),
                      child: BlocBuilder<ProgressBloc, ProgressState>(
                        builder: (contextRoutineScreen, state) {
                          Map<String, dynamic> Habits = {};
                          Set<String> nameOfHabits = {};
                          if (state is Progressstate) {
                            Habits = TotalNumberOfmethods(
                                userhabitScreenController.UserHabit.value);
                            nameOfHabits = Habitsname().toSet();
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: TotalNumberOfmethods(
                                            userhabitScreenController
                                                .UserHabit.value)
                                        .length <=
                                    0
                                ? 10
                                : TotalNumberOfmethods(userhabitScreenController
                                        .UserHabit.value)
                                    .length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Habits.length <= 0
                                      ? AnimatedContainer(
                                          width: 70,
                                          height: 150,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Theme.of(context)
                                                .inputDecorationTheme
                                                .fillColor,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32),
                                                topRight: Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 700),
                                        )
                                      : AnimatedContainer(
                                          width: 70,
                                          height: 150,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: convertToColor(Habits[
                                                nameOfHabits.elementAt(
                                                    index)]['colors']),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32),
                                                topRight: Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 700),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: CircularPercentIndicator(
                                                  radius: 25.0,
                                                  reverse: true,
                                                  restartAnimation: false,
                                                  animation: false,
                                                  animateFromLastPercent: false,
                                                  lineWidth: 5.0,
                                                  percent: calculateProgressPercentage(
                                                      TotalNumberOfmethods(userhabitScreenController
                                                                  .UserHabit
                                                                  .value)[nameOfHabits.elementAt(index)]
                                                              ['Progress'][
                                                          DateFormat('dd-MM-yyyy').format(
                                                              DateTime.now())],
                                                      TotalNumberOfmethods(
                                                          userhabitScreenController
                                                              .UserHabit
                                                              .value)[nameOfHabits.elementAt(index)]['target']),
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.3),
                                                  center: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: ShapeDecoration(
                                                      color: Theme.of(context)
                                                          .inputDecorationTheme
                                                          .fillColor,
                                                      shape: const OvalBorder(
                                                        eccentricity: 0,
                                                      ),
                                                    ),
                                                    child: Center(
                                                        child: SvgPicture.asset(
                                                      TotalNumberOfmethods(
                                                          userhabitScreenController
                                                              .UserHabit
                                                              .value)[nameOfHabits
                                                          .elementAt(
                                                              index)]['icon'],
                                                      height: 20,
                                                      width: 20,
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.color,
                                                    )),
                                                  ),
                                                  progressColor:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.color,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: SizedBox(
                                                  width: 55,
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      nameOfHabits
                                                          .elementAt(index),
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.color,
                                                        fontSize: 10,
                                                        fontFamily: 'DM Sans',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${calculateStreak(TotalNumberOfmethods(userhabitScreenController.UserHabit.value)[nameOfHabits.elementAt(index)]['Progress'])} days',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.color,
                                                  fontSize: 10,
                                                  fontFamily: 'DM Sans',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 41,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor),
                child: Center(
                  child: Text(
                    'Current Streak',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 282,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: () {
                              setState(() {
                                if(weekNumber>1){
                                  weekNumber = weekNumber - 1;
                                }
                              });
                            }, icon: Icon(Icons.arrow_back_ios_rounded,
                              color: Theme.of(contextProgress)
                                  .textTheme
                                  .titleMedium
                                  ?.color, ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return MonthDialogPicker(callback: (String){}); // Show the dialog
                                    },
                                  );
                                },
                                child: Text(
                                  "${DateFormat('MMMM').format(DateTime.now())}, Week $weekNumber",
                                  style: TextStyle(
                                      color: Theme.of(contextProgress)
                                          .textTheme
                                          .titleMedium
                                          ?.color),
                                ),
                              ),
                            ),
                            IconButton(onPressed: () {
                              if(weekNumber<getTotalWeeksInMonth(DateTime.now().year, DateTime.now().month))
                              { setState(() {
                              weekNumber = weekNumber + 1;
                              });}

                              print(weekNumber);

                            }, icon: Icon(Icons.arrow_forward_ios_rounded,
                              color: Theme.of(contextProgress)
                                  .textTheme
                                  .titleMedium
                                  ?.color, ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 80.0),
                        child: MyGraph(
                          weelySummery: generateWeekWiseDates(DateFormat('MMMM').format(DateTime.now()), 'week ${weekNumber}', TotalNumberOfmethods(userhabitScreenController.UserHabit.value),"Morning Walk"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

List<String> nameOfHabits = [];
TotalNumberOfmethods(Map<String, dynamic> userhabits) {
  Map<String, dynamic> Habits = {};
  int totalnumberofHabits = 0;
  userhabits.forEach((key, value) {
    totalnumberofHabits =
        totalnumberofHabits + int.parse(value.length.toString());
    value.forEach((element) {
      element.forEach((key, value) {
        if (value['dates']
            .containsKey(DateFormat('MMMM').format(DateTime.now()))) {
          if (value['dates'][DateFormat('MMMM').format(DateTime.now())]
              .contains(DateTime.now().day)) {
            Habits[key] = value;
          }
        }
      });
    });
  });
  nameOfHabits = Habitsname();
  return Habits;
}

List<String> Habitsname() {
  userhabitScreenController.UserHabit.value.forEach((key, value) {
    value.forEach((element) {
      element.forEach((key, value) {
        if (value['dates']
            .containsKey(DateFormat('MMMM').format(DateTime.now()))) {
          if (value['dates'][DateFormat('MMMM').format(DateTime.now())]
              .contains(DateTime.now().day)) {
            nameOfHabits.add(key);
          }
        }
      });
    });
  });
  return nameOfHabits;
}

int calculateStreak(Map<String, dynamic> dateValues) {
  if (dateValues.isEmpty) return 0; // Return 0 if the map is empty

  var streak = 0;
  var maxStreak = 0;
  DateTime? lastDate;
  var consecutiveCount =
      0; // Tracks the count of consecutive days with non-zero values
  DateFormat dateFormat = DateFormat("dd-MM-yyyy"); // Define the date format

  // Initialize streak based on the first entry if it meets the criteria
  var firstEntryValue = dateValues.entries.first.value;
  int firstValue = firstEntryValue is int
      ? firstEntryValue
      : int.tryParse(firstEntryValue.toString()) ?? 0;
  if (firstValue > 0) {
    streak = 1;
    consecutiveCount = 1;
  }

  for (var entry in dateValues.entries) {
    DateTime currentDate;
    try {
      currentDate = dateFormat.parse(entry.key);
    } catch (e) {
      // If there's an error in parsing the date, print it out and continue with the next iteration
      print("Error parsing date [${entry.key}]: $e");
      continue;
    }

    int value = entry.value is int
        ? entry.value
        : int.tryParse(entry.value.toString()) ?? 0;

    if (lastDate != null) {
      if (currentDate.difference(lastDate).inDays == 1) {
        if (value != 0) {
          consecutiveCount++;
          streak++;
        } else {
          if (consecutiveCount >= 3) {
            maxStreak = Math.max(streak, maxStreak);
          }
          streak = 0;
          consecutiveCount = 0;
        }
      } else {
        if (consecutiveCount >= 3) {
          maxStreak = Math.max(streak, maxStreak);
        }
        streak = value != 0 ? 1 : 0;
        consecutiveCount = value != 0 ? 1 : 0;
      }
    }

    lastDate = currentDate;
  }

  if (consecutiveCount >= 3) {
    maxStreak = Math.max(streak, maxStreak);
  }

  // Ensure at least a streak of 1 if the first value is greater than 0 and only one entry is present or all values are 0 after the first
  if (dateValues.length == 1 && firstValue > 0) {
    maxStreak = Math.max(1, maxStreak);
  }

  return maxStreak;
}

double calculateProgressPercentage(int progress, String target) {
  if (int.parse(target.isNotEmpty && target != null ? target : '0') == 0) {
    // Prevent division by zero
    return 0;
  }
  return progress /
      int.parse(target.isNotEmpty && target != null ? target : '0');
}

int todatsProgress(Map<String, dynamic> habit) {
  int percentage = 0;

  habit.forEach((key, value) {
    if (value['Progress']
        .containsKey(DateFormat('dd-MM-yyyy').format(DateTime.now()))) {
      if (value['Progress'][DateFormat('dd-MM-yyyy').format(DateTime.now())] ==
          int.parse(value['target'])) {
        percentage = percentage + 1;
      }
    } else {
      percentage = 0;
    }
  });

  return int.parse(((percentage / habit.length) * 100).toStringAsFixed(0));
}





List<double> generateWeekWiseDates(String monthName,String week,Map<String, dynamic> habits, String Habitname) {
  // Initialize the list to store week-wise dates
  List<Map<String, dynamic>> weekWiseDates = [];

  // Parse the month name into a DateTime object with the current year
  DateTime firstDayOfMonth = DateFormat("dd-MM-yyyy").parse("01-${_monthNumber(monthName)}-${DateTime.now().year}");

  // Get the number of days in the month
  int daysInMonth = DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

  // Calculate the number of weeks in the month
  int weeksInMonth = ((daysInMonth + firstDayOfMonth.weekday - 1) / 7).ceil();

  // Iterate through each week
  for (int i = 0; i < weeksInMonth; i++) {
    // Initialize the start date for each week
    DateTime startDate = firstDayOfMonth.add(Duration(days: i * 7 - firstDayOfMonth.weekday + 1));

    // Calculate the end date for each week
    DateTime endDate = startDate.add(Duration(days: 6));

    // If the end date is in the next month, adjust it to include all remaining days in the current month
    if (endDate.month != firstDayOfMonth.month) {
      endDate = DateTime(firstDayOfMonth.year, firstDayOfMonth.month, daysInMonth);
    }

    // Initialize the week map with dates and zero values
    Map<String, dynamic> weekMap = {
      'week ${i + 1}': {
        for (int j = startDate.day; j <= endDate.day; j++)
          DateFormat("dd-MM-yyyy").format(DateTime(firstDayOfMonth.year, firstDayOfMonth.month, j)): 0
      }
    };

    // Add the week map to the list
    weekWiseDates.add(weekMap);
  }
  Map<String,double> weekProgress = {};
  weekWiseDates.forEach((element) {
    element.forEach((Weekkey, valueDate) {

      if(Weekkey==week){
         valueDate.forEach((key, value) {
           weekProgress.putIfAbsent(key, () => 0);
         });
        habits.forEach((key, value) {

         if(Habitname!="All"){
           if(key==Habitname){
             value.forEach((key,valueHabit){
               if(key=='Progress'){
                 valueDate.forEach((keyDate, valueDate) {
                   if(valueHabit.containsKey(keyDate)){
                     weekProgress.update(keyDate, (value) => double.parse(valueHabit[keyDate].toString()));
                   }
                 });
               }


             });
           }
         }

        });
      }
    });
  });
    List<double> weekProgressList = [];
    weekProgress.forEach((key, value) {
      weekProgressList.add(value);
    });

  return weekProgressList;
}

// Helper function to get the month number from its abbreviation
String _monthNumber(String monthName) {
  switch (monthName.toLowerCase()) {
    case 'january':
      return '01';
    case 'february':
      return '02';
    case 'march':
      return '03';
    case 'april':
      return '04';
    case 'may':
      return '05';
    case 'june':
      return '06';
    case 'july':
      return '07';
    case 'august':
      return '08';
    case 'september':
      return '09';
    case 'october':
      return '10';
    case 'november':
      return '11';
    case 'december':
      return '12';
    default:
      throw ArgumentError('Invalid month name: $monthName');
  }
}


int _getWeekNumber(DateTime date) {
  // Get the first day of the month
  DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

  // Calculate the week number of the first day of the month
  int firstWeekNumber = firstDayOfMonth.weekday > 1 ? 2 : 1;

  // Calculate the difference between the current day and the first day of the month
  int difference = date.day - firstDayOfMonth.day;

  // Calculate the week number
  int weekNumber = firstWeekNumber + (difference / 7).floor();

  return weekNumber;
}

int getTotalWeeksInMonth(int year, int month) {
  // Get the first day of the current month
  DateTime firstDayOfMonth = DateTime(year, month, 1);

  // Get the first day of the next month
  DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);

  // Calculate the difference in days between the first day of the current month and the first day of the next month
  int differenceInDays = firstDayOfNextMonth.difference(firstDayOfMonth).inDays;

  // Calculate the total number of weeks in the month
  int totalWeeksInMonth = (differenceInDays / 7).ceil();
  print("Total weeks in month: $totalWeeksInMonth weeks");
  return totalWeeksInMonth;
}