import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Widgets/BottomSheet/RepeatsEveryDay/MonthCalenderWithFoCustomDates/month_calender_for_custom_dates.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import '../MonthCalenderForEndDate/month_calender_for_end_date.dart';
import '../bottom_sheet_bloc.dart';

class RepeastFeatures extends StatelessWidget {
  final PageController pageController2;
  final PageController pageController;
  final List<String> daysOfWeek;
   RepeastFeatures({super.key,required this.pageController2,required this.pageController,required this.daysOfWeek});
  final List<String> daysOfWeekOnlyOneChar = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S'
  ];


  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<BottomSheetBloc, BottomSheetState>(
        builder: (context, state) {
          bool repeatCycle = false;
          String option = "Daily";
          bool numberPicker = false;
          int numberPickerValue = 0;
          bool setendDate = false;
          if (state is RepeatCycleState) {
            repeatCycle = state.repeat;
            option = state.whichOption;
            numberPicker = state.Frequency;
            numberPickerValue = state.numberPickervalue;
            setendDate = state.setEndDate;
            DaysofWeek = state.onWhichDayif;
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
                            pageController2.previousPage(
                                duration: const Duration(milliseconds: 10),
                                curve: Curves.easeOut);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.color,
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
                            color: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.color,
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
                          BlocProvider.of<BottomSheetBloc>(context).add(
                              RepeatCycleEvent(
                                  repeat: value,
                                  onWhichDaysIfweeklu: DaysofWeek));
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
                                .displayLarge
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
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: repeatCycle
                                ? () {
                              BlocProvider.of<BottomSheetBloc>(
                                  context)
                                  .add(RepeatCycleEvent(
                                  repeat: true,
                                  whichOption: "Daily",
                                  onWhichDaysIfweeklu:
                                  DaysofWeek));
                            }
                                : () {},
                            child: Container(
                              width: 80,
                              height: 27,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: ShapeDecoration(
                                color: option == "Daily"
                                    ? const Color(0xFF9D6BCE)
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
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Daily',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge
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
                            onTap: repeatCycle
                                ? () {
                              BlocProvider.of<BottomSheetBloc>(
                                  context)
                                  .add(RepeatCycleEvent(
                                  repeat: true,
                                  whichOption: "Weekly",
                                  onWhichDaysIfweeklu:
                                  DaysofWeek));
                            }
                                : () {},
                            child: Container(
                              width: 80,
                              height: 27,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: ShapeDecoration(
                                color: option == "Weekly"
                                    ? const Color(0xFF9D6BCE)
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
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Weekly',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge
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
                            onTap: repeatCycle
                                ? () {
                              BlocProvider.of<BottomSheetBloc>(
                                  context)
                                  .add(RepeatCycleEvent(
                                  repeat: true,
                                  whichOption: "Monthly",
                                  onWhichDaysIfweeklu:
                                  DaysofWeek));
                            }
                                : () {},
                            child: Container(
                              width: 100,
                              height: 27,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: ShapeDecoration(
                                color: option == "Monthly"
                                    ? const Color(0xFF9D6BCE)
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
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Monthly',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge
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
                      Visibility(
                          visible: option == "Weekly",
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width - 15,
                                height: 40,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: daysOfWeekOnlyOneChar.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (DaysofWeek.contains(
                                                index)) {
                                              DaysofWeek.remove(index);
                                            } else {
                                              DaysofWeek.add(index);
                                            }
                                            BlocProvider.of<
                                                BottomSheetBloc>(
                                                context)
                                                .add(RepeatCycleEvent(
                                                repeat: true,
                                                whichOption: option,
                                                Frequency: false,
                                                onWhichDaysIfweeklu:
                                                DaysofWeek));
                                          },
                                          child: Container(
                                            width: 50,
                                            height: 10,
                                            decoration: ShapeDecoration(
                                              color: DaysofWeek.contains(
                                                  index)
                                                  ? const Color(0xFF9D6BCE)
                                                  : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .fillColor,
                                              //Color(0xFF9D6BCE),
                                              shape: const OvalBorder(
                                                eccentricity: 0,
                                              ),
                                            ),
                                            child: Center(
                                                child: Text(
                                                    daysOfWeekOnlyOneChar[
                                                    index])),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          )),
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
                                      .displayLarge
                                      ?.color,
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: repeatCycle
                                    ? () {
                                  BlocProvider.of<BottomSheetBloc>(
                                      context)
                                      .add(RepeatCycleEvent(
                                      repeat: true,
                                      whichOption: option,
                                      Frequency: !numberPicker,
                                      onWhichDaysIfweeklu:
                                      DaysofWeek));
                                }
                                    : () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Every ${whichOption(optionName: option)}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge
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
                                          .displayLarge
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
                        opacity: numberPicker ? 1 : 0,
                        duration: const Duration(milliseconds: 800),
                        child: Visibility(
                          visible: numberPicker,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
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
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                    haptics: true,
                                    minValue: 0,
                                    maxValue: 31,
                                    value: numberPickerValue,
                                    onChanged: (int value) {
                                      BlocProvider.of<BottomSheetBloc>(
                                          context)
                                          .add(RepeatCycleEvent(
                                          repeat: true,
                                          whichOption: option,
                                          Frequency: numberPicker,
                                          numberPickervalue: value,
                                          onWhichDaysIfweeklu:
                                          DaysofWeek));
                                    },
                                  ),
                                  Text(
                                    whichOption(optionName: option),
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
                                  horizontal: 20.0,
                                ),
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
                        padding:
                        const EdgeInsets.only(left: 25.0, right: 10),
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
                                      .displayLarge
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
                                    .add(RepeatCycleEvent(
                                  repeat: true,
                                  whichOption: option,
                                  Frequency: numberPicker,
                                  numberPickervalue: numberPickerValue,
                                  setEndDate: value,
                                  onWhichDaysIfweeklu: DaysofWeek,
                                ));
                              },
                              activeColor: Colors.transparent,
                              thumbColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const Color(
                                          0xFF9D6BCE); // Change the color when selected
                                    }
                                    return Colors.grey; // Default color
                                  }),
                              trackOutlineColor:
                              MaterialStateProperty.resolveWith(
                                      (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Theme.of(context)
                                          .textTheme
                                          .displayLarge
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
                                    .format(DateTime(
                                    2024, DateTime.now().month));
                                if (state is RepeatCycleState) {
                                  monthname = DateFormat.MMMM().format(
                                      DateTime(2024, state.monthIndex));
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios_rounded,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                              ?.color),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text(
                                          '$monthname, 2024',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .displayLarge
                                                ?.color,
                                            fontSize: 16,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward_ios_rounded,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                              ?.color),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            // Row for the days of the week
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: daysOfWeek
                                    .map((day) => Text(
                                  day,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ))
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Calendar View
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: PageView.builder(
                                    controller: pageController,
                                    itemCount: 12,
                                    onPageChanged: (value) {
                                      BlocProvider.of<BottomSheetBloc>(
                                          context)
                                          .add(RepeatCycleEvent(
                                          repeat: true,
                                          whichOption: option,
                                          Frequency: numberPicker,
                                          numberPickervalue:
                                          numberPickerValue,
                                          setEndDate: setendDate,
                                          monthIndex: value,
                                          onWhichDaysIfweeklu:
                                          DaysofWeek));
                                    },
                                    itemBuilder: (context, index) {
                                      return MonthlyGridForEndDate(
                                        monthIndex: index,
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
