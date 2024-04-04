import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Progress/progress_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as Math;

import '../Routine/SubScreens/stacking_cards.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userhabitScreenController.UserHabit.value);
    BlocProvider.of<ProgressBloc>(context)
        .add(Progresschangeevent(userhabitScreenController.UserHabit.value));
  }

  @override
  Widget build(BuildContext context) {
    print("hello");
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
                return Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text(
                    '0%',
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
                            print(nameOfHabits);
                            print(Habits['Eat fruits']);
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                                      TotalNumberOfmethods(userhabitScreenController.UserHabit.value)[nameOfHabits.elementAt(index)]
                                                              ['Progress'][
                                                          DateFormat('dd-MM-yyyy').format(
                                                              selectedDate)],
                                                      TotalNumberOfmethods(
                                                          userhabitScreenController
                                                              .UserHabit
                                                              .value)[nameOfHabits
                                                          .elementAt(index)]['target']),
                                                  backgroundColor: Colors.grey,
                                                  center: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: ShapeDecoration(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.color,
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
                                                          .scaffoldBackgroundColor,
                                                    )),
                                                  ),
                                                  progressColor: Theme.of(
                                                          context)
                                                      .scaffoldBackgroundColor,
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
                                                calculateStreak(TotalNumberOfmethods(
                                                            userhabitScreenController
                                                                .UserHabit
                                                                .value)[nameOfHabits
                                                            .elementAt(
                                                                index)]['Progress'])
                                                        .toString() +
                                                    ' days',
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
      // print(element);
      Habits.addEntries(element.entries);
    });
  });
  nameOfHabits = Habitsname();
  return Habits;
}

List<String> Habitsname() {
  userhabitScreenController.UserHabit.value.forEach((key, value) {
    value.forEach((element) {
      element.forEach((key, value) {
        nameOfHabits.add(key);
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
  print(
      'progress : $progress and target : ${int.parse(target.isNotEmpty && target != null ? target : "0")}${progress / int.parse(target.isNotEmpty && target != null ? target : '0')}');
  if (int.parse(target.isNotEmpty && target != null ? target : '0') == 0) {
    // Prevent division by zero
    return 0;
  }
  print('progress: ${progress / int.parse(target)}, target: $target)');
  return progress /
      int.parse(target.isNotEmpty && target != null ? target : '0');
}
