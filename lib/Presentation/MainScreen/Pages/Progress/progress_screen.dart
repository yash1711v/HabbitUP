import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Progress/ViewAllScreen/view_all_screen.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Progress/progress_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:habitup/Widgets/DialogBox/MonthPickerDialogBox/month_picker_dialog_box.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String month = DateFormat('MMMM').format(DateTime.now());
  String Streak = 0.toString();
  int Selectedindex = -1;
  String habitname = "All";
  List<double> chartValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
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
    return SingleChildScrollView(
      child: Column(
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
                      '${progress != null ? progress : 0}%',
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
                                updateStreak(TotalNumberOfmethods(
                                        userhabitScreenController
                                            .UserHabit.value)[nameOfHabits
                                        .elementAt(index)]['Progress'])
                                    .then((value) {
                                  setState(() {
                                    Streak = value.toString();
                                  });
                                });
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
                                        : GestureDetector(
                                            onTap: () {
                                              if (Selectedindex == index) {
                                                setState(() {
                                                  Selectedindex = -1;
                                                  habitname = "All";
                                                });
                                                setState(() {
                                                  chartValues = generateWeekWiseDates(
                                                      month,
                                                      'week ${weekNumber}',
                                                      TotalNumberOfmethods(
                                                          userhabitScreenController
                                                              .UserHabit.value),
                                                      habitname);
                                                });
                                                print(chartValues);
                                              } else {
                                                setState(() {
                                                  Selectedindex = index;
                                                  habitname = nameOfHabits
                                                      .elementAt(Selectedindex);
                                                });
                                              }
                                              setState(() {
                                                chartValues = generateWeekWiseDates(
                                                    month,
                                                    'week ${weekNumber}',
                                                    TotalNumberOfmethods(
                                                        userhabitScreenController
                                                            .UserHabit.value),
                                                    habitname);
                                              });
                                              print(chartValues);
                                            },
                                            child: Stack(
                                              children: [
                                                AnimatedContainer(
                                                  width: 70,
                                                  height: Selectedindex == index
                                                      ? 178
                                                      : 150,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: convertToColor(Habits[
                                                        nameOfHabits.elementAt(
                                                            index)]['colors']),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(32),
                                                        topRight:
                                                            Radius.circular(30),
                                                      ),
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 700),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 15.0),
                                                        child:
                                                            CircularPercentIndicator(
                                                          radius: 25.0,
                                                          reverse: true,
                                                          restartAnimation: false,
                                                          animation: false,
                                                          animateFromLastPercent:
                                                              false,
                                                          lineWidth: 5.0,
                                                          percent: calculateProgressPercentage(
                                                              TotalNumberOfmethods(userhabitScreenController.UserHabit.value)[nameOfHabits.elementAt(index)]
                                                                  ['Progress'][DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(DateTime
                                                                      .now())],
                                                              TotalNumberOfmethods(
                                                                  userhabitScreenController
                                                                      .UserHabit
                                                                      .value)[nameOfHabits.elementAt(index)]['target']),
                                                          backgroundColor: Colors
                                                              .black
                                                              .withOpacity(0.3),
                                                          center: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .inputDecorationTheme
                                                                  .fillColor,
                                                              shape:
                                                                  const OvalBorder(
                                                                eccentricity: 0,
                                                              ),
                                                            ),
                                                            child: Center(
                                                                child: SvgPicture
                                                                    .asset(
                                                              TotalNumberOfmethods(
                                                                  userhabitScreenController
                                                                      .UserHabit
                                                                      .value)[nameOfHabits
                                                                  .elementAt(
                                                                      index)]['icon'],
                                                              height: 20,
                                                              width: 20,
                                                              color: Theme.of(
                                                                      context)
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
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10.0),
                                                        child: SizedBox(
                                                          width: 55,
                                                          child: FittedBox(
                                                            fit: BoxFit.fitWidth,
                                                            child: Text(
                                                              nameOfHabits
                                                                  .elementAt(
                                                                      index),
                                                              style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium
                                                                    ?.color,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    'DM Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${Streak} days',
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: Selectedindex == index,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 100.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 50.0),
                                                          child: SvgPicture.asset(
                                                            "assets/ImagesY/Progress/MinimineIcon.svg",
                                                            color:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium
                                                                    ?.color,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                  height: 60,
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
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 282,
                //     decoration: ShapeDecoration(
                //       color: Theme.of(context).inputDecorationTheme.fillColor,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //     ),
                //     child: Stack(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(top: 7.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               IconButton(
                //                 onPressed: () {
                //                   setState(() {
                //                     if (weekNumber > 1) {
                //                       weekNumber = weekNumber - 1;
                //                       setState(() {
                //                         chartValues = generateWeekWiseDates(
                //                             month,
                //                             'week ${weekNumber}',
                //                             TotalNumberOfmethods(
                //                                 userhabitScreenController
                //                                     .UserHabit.value),
                //                             habitname);
                //                       });
                //                     }
                //                   });
                //                 },
                //                 icon: Icon(
                //                   Icons.arrow_back_ios_rounded,
                //                   color: Theme.of(contextProgress)
                //                       .textTheme
                //                       .titleMedium
                //                       ?.color,
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 15.0),
                //                 child: GestureDetector(
                //                   onTap: () {
                //                     showDialog(
                //                       context: context,
                //                       builder: (context) {
                //                         return MonthDialogPicker(
                //                           callback: (value) {
                //                             setState(() {
                //                               month = value;
                //                             });
                //                             setState(() {
                //                               chartValues = generateWeekWiseDates(
                //                                   value,
                //                                   'week ${weekNumber}',
                //                                   TotalNumberOfmethods(
                //                                       userhabitScreenController
                //                                           .UserHabit.value),
                //                                   habitname);
                //                             });
                //                           },
                //                           month: _monthNameinShort(month),
                //                         ); // Show the dialog
                //                       },
                //                     );
                //                   },
                //                   child: Text(
                //                     "${month}, Week $weekNumber",
                //                     style: TextStyle(
                //                         color: Theme.of(contextProgress)
                //                             .textTheme
                //                             .titleMedium
                //                             ?.color),
                //                   ),
                //                 ),
                //               ),
                //               IconButton(
                //                 onPressed: () {
                //                   if (weekNumber <
                //                       getTotalWeeksInMonth(DateTime.now().year,
                //                           DateTime.now().month)) {
                //                     setState(() {
                //                       weekNumber = weekNumber + 1;
                //                     });
                //                   }
                //                   setState(() {
                //                     chartValues = generateWeekWiseDates(
                //                         month,
                //                         'week ${weekNumber}',
                //                         TotalNumberOfmethods(
                //                             userhabitScreenController
                //                                 .UserHabit.value),
                //                         habitname);
                //                   });
                //
                //                   print(chartValues);
                //                 },
                //                 icon: Icon(
                //                   Icons.arrow_forward_ios_rounded,
                //                   color: Theme.of(contextProgress)
                //                       .textTheme
                //                       .titleMedium
                //                       ?.color,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(top: 80.0),
                //           child: BarChart(BarChartData(
                //               gridData: const FlGridData(
                //                 show: false,
                //               ),
                //               borderData: FlBorderData(show: false),
                //               titlesData: const FlTitlesData(
                //                   show: true,
                //                   topTitles: AxisTitles(
                //                     sideTitles: SideTitles(showTitles: false),
                //                   ),
                //                   rightTitles: AxisTitles(
                //                     sideTitles: SideTitles(showTitles: false),
                //                   ),
                //                   leftTitles: AxisTitles(
                //                     sideTitles: SideTitles(showTitles: false),
                //                   ),
                //                   bottomTitles: AxisTitles(
                //                     sideTitles: SideTitles(
                //                         showTitles: true,
                //                         getTitlesWidget: getBottomTiles),
                //                   )),
                //               barGroups: chartValues
                //                   .asMap()
                //                   .entries
                //                   .map((entry) =>
                //                       BarChartGroupData(x: entry.key, barRods: [
                //                         BarChartRodData(
                //                             toY: entry.value.toDouble(),
                //                             color: Theme.of(contextProgress)
                //                                 .textTheme
                //                                 .titleMedium
                //                                 ?.color,
                //                             width: 35.51,
                //                             borderRadius: const BorderRadius.all(
                //                                 Radius.circular(10)),
                //                             backDrawRodData:
                //                                 BackgroundBarChartRodData(
                //                               show: false,
                //                             ))
                //                       ]))
                //                   .toList(),
                //               barTouchData: BarTouchData(
                //                 touchTooltipData: BarTouchTooltipData(
                //                   tooltipRoundedRadius: 8,
                //                   getTooltipItem:
                //                       (group, groupIndex, rod, rodIndex) {
                //                     late String weekDay;
                //                     switch (group.x.toInt()) {
                //                       case 0:
                //                         weekDay = 'Mon';
                //                         break;
                //                       case 1:
                //                         weekDay = 'Tue';
                //                         break;
                //                       case 2:
                //                         weekDay = 'Wed';
                //                         break;
                //                       case 3:
                //                         weekDay = 'Thu';
                //                         break;
                //                       case 4:
                //                         weekDay = 'Fri';
                //                         break;
                //                       case 5:
                //                         weekDay = 'Sat';
                //                         break;
                //                       case 6:
                //                         weekDay = 'Sun';
                //                         break;
                //                     }
                //                     return BarTooltipItem(
                //                       '$weekDay: ${group.barRods[rodIndex].toY.round().toString()}',
                //                       const TextStyle(color: Colors.white),
                //                     );
                //                   },
                //                 ),
                //               ))),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor),
                    child: Center(
                      child: Text(
                        'Your progress journal',
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
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-300,
                  child: BlocBuilder<ProgressBloc, ProgressState>(
                    builder: (context, state) {
                      Map<String, dynamic> Habits = {};
                      Set<String> nameOfHabits = {};
                      if (state is Progressstate) {
                        Habits = TotalNumberOfmethods(
                            userhabitScreenController.UserHabit.value);
                        nameOfHabits = Habitsname().toSet();
                      }
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: Habits.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 23.0,vertical: 10),
                              child: Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 25.0,
                                    reverse: true,
                                    restartAnimation: false,
                                    animation: false,
                                    animateFromLastPercent:
                                    false,
                                    lineWidth: 5.0,
                                    percent: calculateProgressPercentage(
                                        TotalNumberOfmethods(userhabitScreenController.UserHabit.value)[nameOfHabits.elementAt(index)]
                                        ['Progress'][DateFormat(
                                            'dd-MM-yyyy')
                                            .format(DateTime
                                            .now())],
                                        TotalNumberOfmethods(
                                            userhabitScreenController
                                                .UserHabit
                                                .value)[nameOfHabits.elementAt(index)]['target']),
                                    backgroundColor: Colors
                                        .black
                                        .withOpacity(0.3),
                                    center: Container(
                                      width: 40,
                                      height: 40,
                                      decoration:
                                      ShapeDecoration(
                                        color: Theme.of(
                                            context)
                                            .inputDecorationTheme
                                            .fillColor,
                                        shape:
                                        const OvalBorder(
                                          eccentricity: 0,
                                        ),
                                      ),
                                      child: Center(
                                          child: SvgPicture
                                              .asset(
                                            TotalNumberOfmethods(
                                                userhabitScreenController
                                                    .UserHabit
                                                    .value)[nameOfHabits
                                                .elementAt(
                                                index)]['icon'],
                                            height: 20,
                                            width: 20,
                                            color: Theme.of(
                                                context)
                                                .textTheme
                                                .titleMedium
                                                ?.color,
                                          )),
                                    ),
                                    progressColor: convertToColor(Habits[
                                    nameOfHabits.elementAt(
                                        index)]['colors']),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  nameOfHabits.elementAt(index),
                                                  style: TextStyle(
                                                      color: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.color,
                                                    fontSize: 16,
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),

                                                ),




                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                              Get.to(ViewAllScreen(habitName: nameOfHabits.elementAt(index),Habits: Habits,));
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 250),
                                                child: Text(
                                                  'View all',
                                                  style: TextStyle(
                                                    color: convertToColor(Habits[
                                                    nameOfHabits.elementAt(
                                                        index)]['colors']),
                                                    fontSize: 10,
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 246,
                                              height: 26,
                                              child: TruncatedText( Habits[
                                              nameOfHabits.elementAt(
                                                  index)]['logs'][DateFormat("dd-MM-yyyy").format(DateTime.now())].toString(),maxLength: 60,),

                                            ),
                                          ],
                                        )


                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),

                Container()
              ],
            ),
          )
        ],
      ),
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

SharedPreferences? _prefs;

Future<void> initPrefs() async {
  _prefs = await SharedPreferences.getInstance();
}

Future<int> updateStreak(Map<String, dynamic> data) async {
  await initPrefs();

  DateFormat formater = DateFormat('dd-MM-yyyy');
  DateTime now = DateTime.now();
  // Ensuring we work with dates in ascending order.
  List<String> sortedDateKeys = data.keys.toList()
    ..sort((a, b) => formater.parse(a).compareTo(formater.parse(b)));

  int streakCount = 0;
  String previousDate = formater.format(now.subtract(Duration(days: 1)));

  DateTime startdate = _prefs?.getString('streakStartDate') != null
      ? formater.parse(_prefs!.getString('streakStartDate')!)
      : now;

  bool allZero = data.values.every((v) => v == 0);
  String firstDateStr = data.keys.first;
  if (allZero) {
    startdate = formater.parse(firstDateStr);
  }
  _prefs?.setString('streakStartDate', formater.format(startdate));
  if (formater.format(startdate) == formater.format(now)) {
    if (data[formater.format(startdate)] > 0) {
      streakCount++;
    }
  } else {
    if (data[previousDate] > 0) {
      for (DateTime i = startdate; i.isBefore(now); i.add(Duration(days: 1))) {
        if (data[formater.format(i)] > 0) {
          streakCount++;
        } else {
          break;
        }
      }
    } else {
      startdate = DateTime.now();
    }
  }

  return streakCount; // Return the calculated or ongoing streak count.
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

  if (habit.isNotEmpty && habit != null) {
    habit.forEach((key, value) {
      if (value['Progress']
          .containsKey(DateFormat('dd-MM-yyyy').format(DateTime.now()))) {
        if (value['Progress']
                [DateFormat('dd-MM-yyyy').format(DateTime.now())] ==
            int.parse(value['target'])) {
          percentage = percentage + 1;
        }
      } else {
        percentage = 0;
      }
    });
  } else {
    return 0;
  }

  return int.parse(((percentage / habit.length) * 100).toStringAsFixed(0));
}

List<double> generateWeekWiseDates(String monthName, String week,
    Map<String, dynamic> habits, String Habitname) {
  // Initialize the list to store week-wise dates
  List<Map<String, dynamic>> weekWiseDates = [];
  List<double> weekProgressList = [];

  // Parse the month name into a DateTime object with the current year
  DateTime firstDayOfMonth = DateFormat("dd-MM-yyyy")
      .parse("01-${_monthNumber(monthName)}-${DateTime.now().year}");

  // Get the number of days in the month
  int daysInMonth =
      DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

  // Calculate the number of weeks in the month
  int weeksInMonth = ((daysInMonth + firstDayOfMonth.weekday - 1) / 7).ceil();

  // Iterate through each week
  for (int i = 0; i < weeksInMonth; i++) {
    // Initialize the start date for each week
    DateTime startDate = firstDayOfMonth
        .add(Duration(days: i * 7 - firstDayOfMonth.weekday + 1));

    // Calculate the end date for each week
    DateTime endDate = startDate.add(Duration(days: 6));

    // If the end date is in the next month, adjust it to include all remaining days in the current month
    if (endDate.month != firstDayOfMonth.month) {
      endDate =
          DateTime(firstDayOfMonth.year, firstDayOfMonth.month, daysInMonth);
    }

    // Initialize the week map with dates and zero values
    Map<String, dynamic> weekMap = {
      'week ${i + 1}': {
        for (int j = startDate.day; j <= endDate.day; j++)
          DateFormat("dd-MM-yyyy").format(
              DateTime(firstDayOfMonth.year, firstDayOfMonth.month, j)): 0
      }
    };

    // Add the week map to the list
    weekWiseDates.add(weekMap);
  }
  Map<String, double> weekProgress = {};
  weekProgress.clear();
  weekWiseDates.forEach((element) {
    element.forEach((Weekkey, valueDate) {
      if (Weekkey == week) {
        valueDate.forEach((key, value) {
          weekProgress.putIfAbsent(key, () => 0);
        });

        habits.forEach((key, values) {
          if (Habitname != "All") {
            if (key == Habitname) {
              values.forEach((key, valueHabit) {
                if (key == 'Progress') {
                  weekProgress.forEach((keyDate, valueDate) {
                    if (valueHabit.containsKey(keyDate)) {
                      weekProgress.update(
                          keyDate,
                          (value) =>
                              double.parse(valueHabit[keyDate].toString()));
                    }
                  });
                }
              });
            }
          } else {
            int completed = 0;
            values.forEach((key2, valueHabit) {
              if (key2 == 'Completed') {
                if (valueHabit[
                    DateFormat('dd-MM-yyyy').format(DateTime.now())]) {
                  completed++;

                  valueDate.forEach((keyDate, valueDate) {
                    if (valueHabit.containsKey(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()))) {
                      weekProgress.update(
                          DateFormat('dd-MM-yyyy').format(DateTime.now()),
                          (value) => double.parse(completed.toString()));
                    }
                  });
                }
                ;
              }
              // valueDate.forEach((keyDate, valueDate) {
              //   if(valueHabit[DateFormat('dd-MM-yyyy').format(DateTime.now())]){
              //     completed++;
              //     valueDate.forEach((keyDate, valueDate) {
              //       if (valueHabit.containsKey(keyDate)) {
              //         weekProgress.update(
              //             keyDate,
              //                 (value) =>
              //                 double.parse(completed.toString()));
              //       }
              //     });
              //
              //   };
              // });
            });
          }
        });
      }
    });
  });

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

String _monthNameinShort(String monthName) {
  switch (monthName.toLowerCase()) {
    case 'january':
      return 'Jan';
    case 'february':
      return 'Feb';
    case 'march':
      return 'Mar';
    case 'april':
      return 'Apr';
    case 'may':
      return 'May';
    case 'june':
      return 'June';
    case 'july':
      return 'July';
    case 'august':
      return 'Aug';
    case 'september':
      return 'Sept';
    case 'october':
      return 'Oct';
    case 'november':
      return 'Nov';
    case 'december':
      return 'Dec';
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

class TruncatedText extends StatelessWidget {
  final String text;
  final int maxLength;

  TruncatedText(this.text, {this.maxLength = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      (text.length <= maxLength)
          ? text
          : '${text.substring(0, maxLength)}...',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          color: Theme.of(
              context)
              .textTheme
              .titleMedium
              ?.color,
        fontSize: 12,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 0,
      ),// Ensure it only takes a single line
    );
  }
}