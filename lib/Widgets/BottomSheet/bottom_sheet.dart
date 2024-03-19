

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/Widgets/BottomSheet/bottom_sheet_bloc.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class BottomSheetCustom extends StatelessWidget {
  BottomSheetCustom({Key? key}) : super(key: key);

  // State variable to keep track of the selected date
  int? selectedDate;

  final currentMonth = DateTime.now().month;

  PageController _pageController =
      PageController(initialPage: DateTime.now().month - 1);
  PageController _pageController2 = PageController();

  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate the number of days in the current month
    final daysInMonth = DateTime(DateTime.now().year, currentMonth + 1, 0).day;

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: ShapeDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
        ),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController2,
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    width: 76,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<BottomSheetBloc, BottomSheetState>(
                  builder: (context, state) {
                    String? monthname = DateFormat.MMMM()
                        .format(DateTime(2024, DateTime.now().month));
                    if (state is MonthChangeState) {
                      monthname = DateFormat.MMMM()
                          .format(DateTime(2024, state.monthIndex));
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios_rounded,
                              color:
                                  Theme.of(context).textTheme.headline1?.color),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              '${monthname}, 2024',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.color,
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color:
                                  Theme.of(context).textTheme.headline1?.color),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                // Row for the days of the week
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: daysOfWeek
                        .map((day) => Text(
                              day,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 5),
                // Calendar View
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: 12,
                        onPageChanged: (value) {
                          BlocProvider.of<BottomSheetBloc>(context)
                              .add(MothChangeEvent(monthIndex: value + 1));
                        },
                        itemBuilder: (context, index) {
                          return MonthlyGridView(
                            monthIndex: index,
                          );
                        }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextButton(
                    onPressed: () {
                      _pageController2.nextPage(
                          duration: Duration(milliseconds: 10),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Repeats every day',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1?.color,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Theme.of(context).textTheme.headline1?.color,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            BlocBuilder<BottomSheetBloc, BottomSheetState>(
                builder: (context, state) {
              bool repeatCycle = false;
              String option = "Daily";
              bool numberPicker=false;
              int numberPickerValue=0;
              bool setendDate=false;
              if (state is RepeatCycleState) {
                repeatCycle = state.repeat;
                option = state.whichOption;
                numberPicker=state.Frequency;
                numberPickerValue=state.numberPickervalue;
                setendDate=state.setEndDate;
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, left: 10, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                _pageController2.previousPage(
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.easeOut);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color:
                                    Theme.of(context).textTheme.headline1?.color,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Color(0xFF9D6BCE),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 25, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 142,
                            height: 24,
                            child: Text(
                              'Set a repeat Cycle',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.headline1?.color,
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Switch(
                            value: repeatCycle,
                            onChanged: (value) {
                              BlocProvider.of<BottomSheetBloc>(context)
                                  .add(RepeatCycleEvent(repeat: value));
                            },
                            activeColor: Colors.transparent,
                            thumbColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Color(
                                    0xFF9D6BCE); // Change the color when selected
                              }
                              return Colors.grey; // Default color
                            }),
                            trackOutlineColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.color; // Change the color when disabled
                              }
                              return Colors.grey; // Default color
                            }),
                            inactiveTrackColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: Divider(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: repeatCycle ? 1 : 0,
                      duration: Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: repeatCycle?() {
                                  BlocProvider.of<BottomSheetBloc>(context).add(
                                      RepeatCycleEvent(
                                          repeat: true, whichOption: "Daily"));
                                }:(){},
                                child: Container(
                                  width: 80,
                                  height: 27,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: ShapeDecoration(
                                    color: option == "Daily"
                                        ? Color(0xFF9D6BCE)
                                        : Theme.of(context)
                                            .inputDecorationTheme
                                            .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Daily',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: repeatCycle?() {
                                  BlocProvider.of<BottomSheetBloc>(context).add(
                                      RepeatCycleEvent(
                                          repeat: true, whichOption: "Weekly"));
                                }:(){},
                                child: Container(
                                  width: 80,
                                  height: 27,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: ShapeDecoration(
                                    color: option == "Weekly"
                                        ? Color(0xFF9D6BCE)
                                        : Theme.of(context)
                                            .inputDecorationTheme
                                            .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Weekly',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: repeatCycle?() {
                                  BlocProvider.of<BottomSheetBloc>(context).add(
                                      RepeatCycleEvent(
                                          repeat: true, whichOption: "Monthly"));
                                }:(){},
                                child: Container(
                                  width: 100,
                                  height: 27,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: ShapeDecoration(
                                    color: option == "Monthly"
                                        ? Color(0xFF9D6BCE)
                                        : Theme.of(context)
                                            .inputDecorationTheme
                                            .fillColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Monthly',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Divider(
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 142,
                                  height: 24,
                                  child: Text(
                                    'Frequency',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: repeatCycle?() {
                                      BlocProvider.of<BottomSheetBloc>(context).add(RepeatCycleEvent(repeat: true,whichOption: option,Frequency: !numberPicker));
                                    }:(){},
                                    child: Row(
                                      children: [
                                        Text(
                                          'Every ${whichOption(OptionName: option)}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.color,
                                            fontSize: 16,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Divider(
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: numberPicker?1:0,
                            duration: Duration(milliseconds: 800),
                            child: Visibility(
                              visible:numberPicker,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'Every',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      NumberPicker(
                                        infiniteLoop: true,
                                        selectedTextStyle: const TextStyle(
                                          color: Color(0xFF9D6BCE),
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                        textStyle:  TextStyle(
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .fillColor,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                        haptics: true,
                                        minValue: 0, maxValue: 31, value: numberPickerValue, onChanged: (int value) {
                                          BlocProvider.of<BottomSheetBloc>(context).add(RepeatCycleEvent(repeat: true,whichOption: option,Frequency: numberPicker,numberPickervalue: value));
                                      },

                                      ),
                                       Text(
                                        whichOption(OptionName: option),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,),
                                    child: Divider(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 142,
                                  height: 24,
                                  child: Text(
                                    'Set an end date',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Switch(
                                  value: setendDate,
                                  onChanged: (value) {
                                    BlocProvider.of<BottomSheetBloc>(context)
                                        .add(RepeatCycleEvent(repeat: true,whichOption: option,Frequency: numberPicker,numberPickervalue: numberPickerValue,setEndDate: value,));
                                  },
                                  activeColor: Colors.transparent,
                                  thumbColor:
                                  MaterialStateProperty.resolveWith((states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return const Color(
                                          0xFF9D6BCE); // Change the color when selected
                                    }
                                    return Colors.grey; // Default color
                                  }),
                                  trackOutlineColor:
                                  MaterialStateProperty.resolveWith((states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.color; // Change the color when disabled
                                    }
                                    return Colors.grey; // Default color
                                  }),
                                  inactiveTrackColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: setendDate,
                              child: Column(
                                children: <Widget>[
                                  BlocBuilder<BottomSheetBloc, BottomSheetState>(
                                    builder: (context, state) {
                                      String? monthname = DateFormat.MMMM()
                                          .format(DateTime(2024, DateTime.now().month));
                                      if (state is RepeatCycleState) {
                                        monthname = DateFormat.MMMM().format(DateTime(2024, state.monthIndex));
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 30.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.arrow_back_ios_rounded,
                                                color:
                                                Theme.of(context).textTheme.headline1?.color),
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Text(
                                                '${monthname}, 2024',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline1
                                                      ?.color,
                                                  fontSize: 16,
                                                  fontFamily: 'DM Sans',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.arrow_forward_ios_rounded,
                                                color:
                                                Theme.of(context).textTheme.headline1?.color),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  // Row for the days of the week
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: daysOfWeek
                                          .map((day) => Text(
                                        day,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  // Calendar View
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: PageView.builder(
                                          controller: _pageController,
                                          itemCount: 12,
                                          onPageChanged: (value) {
                                            BlocProvider.of<BottomSheetBloc>(context)
                                                .add(RepeatCycleEvent(repeat: true,whichOption: option,Frequency: numberPicker,numberPickervalue: numberPickerValue,setEndDate: setendDate,monthIndex: value));
                                          },
                                          itemBuilder: (context, index) {
                                            return MonthlyGridForEndDate(
                                              monthIndex: index,
                                            );
                                          }),
                                    ),
                                  ),

                                ],
                              ), ),
                          SizedBox(height: 50,)

                        ],
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ));
  }
}

class MonthlyGridView extends StatefulWidget {
  final int monthIndex;

  MonthlyGridView({required this.monthIndex});

  @override
  State<MonthlyGridView> createState() => _MonthlyGridViewState();
}

class _MonthlyGridViewState extends State<MonthlyGridView> {
  Set<int>? selectedDate = {};

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month + widget.monthIndex;
    print(currentMonth);
    final daysInMonth = DateTime(
            DateTime.now().year, int.parse((currentMonth + 1).toString()), 0)
        .day;

    print(daysInMonth);
    final int firstDayIndex =
        (DateTime(DateTime.now().year, currentMonth, 1).weekday + 8) % 7;

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
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
                        ? Color(0xFF9D6BCE)
                        : Colors.transparent,
                    shape: const OvalBorder(eccentricity: 0.1)),
                child: Center(
                  child: Text(
                    '$dayOfMonth',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1?.color,
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

String whichOption({required String OptionName}) {
  if (OptionName == "Daily") {
    return "Day";
  } else if (OptionName == "Weekly") {
    return "Week";
  } else {
    return "Month";
  }
  return "";
}
class MonthlyGridForEndDate extends StatefulWidget {
  final int monthIndex;


  MonthlyGridForEndDate({required this.monthIndex});

  @override
  State<MonthlyGridForEndDate> createState() => _MonthlyGridForEndDateState();
}

class _MonthlyGridForEndDateState extends State<MonthlyGridForEndDate> {
  Set<int>? selectedDate = {};

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month + widget.monthIndex;
    print(currentMonth);
    final daysInMonth = DateTime(
        DateTime.now().year, int.parse((currentMonth + 1).toString()), 0)
        .day;

    print(daysInMonth);
    final int firstDayIndex =
        (DateTime(DateTime.now().year, currentMonth, 1).weekday + 8) % 7;

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
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
                        ? Color(0xFF9D6BCE)
                        : Colors.transparent,
                    shape: const OvalBorder(eccentricity: 0.1)),
                child: Center(
                  child: Text(
                    '$dayOfMonth',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1?.color,
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
