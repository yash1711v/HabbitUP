import 'package:HabitUp/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/custom_habit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HabitUp/CommonMethods/Variable.dart';
import 'package:HabitUp/Widgets/BottomSheet/RepeatsEveryDay/CustomDateFeature/custom_dates_feature.dart';
import 'package:HabitUp/Widgets/BottomSheet/RepeatsEveryDay/MonthCalenderWithFoCustomDates/month_calender_for_custom_dates.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/CustomHabitAdission.dart';
import '../../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habit_adision_bloc.dart';
import '../MonthCalenderForEndDate/month_calender_for_end_date.dart';
import '../bottom_sheet_bloc.dart';

class RepeastFeatures extends StatelessWidget {
  final PageController pageController2;
  final PageController pageController;
  final List<String> daysOfWeek;
  int index;
  BuildContext habitAddisionContext;
  bool newHabit;
  RepeastFeatures(
      {super.key,
      required this.pageController2,
      required this.pageController,
      required this.daysOfWeek,
        required this. index,
        required this.habitAddisionContext,
        this.newHabit=false
      });
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
    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
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
              padding: const EdgeInsets.only(top: 30.0, left: 10, right: 15),
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
                        color: Theme.of(context).textTheme.displayLarge?.color,
                      )),
                  TextButton(
                      onPressed: () {
                        print(datesOnwhichTheHabbitsAreSet);
                        print(numberPickerValue);

                        datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                          datesOnwhichTheHabbitsAreSet[key]?.clear();
                        });
                        if (option == "Daily") {
                          datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                            datesOnwhichTheHabbitsAreSet[key]?.clear();
                          });
                          addDates(
                              frequency: frequencyNumber, endDate: setendDate?endDate:"31-12-2024");
                          pageController2.previousPage(
                              duration: const Duration(milliseconds: 10),
                              curve: Curves.easeOut);
                        }
                        if (option == "Weekly") {
                          datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                            datesOnwhichTheHabbitsAreSet[key]?.clear();
                          });
                          addDatesforweek(
                              frequency: frequencyNumber,
                              endDate: setendDate?endDate:"31-12-2024",
                              daysOfWeek: DaysofWeek);
                          pageController2.previousPage(
                              duration: const Duration(milliseconds: 10),
                              curve: Curves.easeOut);
                        }
                        if (option == "Monthly") {
                          datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                            datesOnwhichTheHabbitsAreSet[key]?.clear();
                          });
                          addDatesForMonthFrequency(
                              frequency: frequencyNumber,
                              endDate: setendDate?endDate:"31-12-2024",
                              daysOfMonth: DatesForMonth);
                          pageController2.previousPage(
                              duration: const Duration(milliseconds: 10),
                              curve: Curves.easeOut);
                        }
                        if(newHabit){
                          properties[index]=whichText(frequencyNumber, whichOption);
                          BlocProvider.of<CustomHabitBloc>(habitAddisionContext).add(SelectedColorEventCustom(properties: properties));
                        }else{
                          Properties[index]=whichText(frequencyNumber, whichOption);
                          BlocProvider.of<HabitAdisionBloc>(habitAddisionContext).add(SelectedColorEvent(SelectedIndex: SelectedIndex,properties: Properties,
                            name: selectedHabit,
                            icon: SelectedHabitIcon,
                            target: target, Subtasks: Subtasks,
                          ));
                        }


                        print(datesOnwhichTheHabbitsAreSet);
                      },
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
              padding: const EdgeInsets.only(top: 5.0, left: 25, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 142,
                    height: 24,
                    child: Text(
                      'Set a repeat Cycle',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge?.color,
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
                      datesOnwhichTheHabbitsAreSet.forEach((key, value) {
                        datesOnwhichTheHabbitsAreSet[key]?.clear();
                      });
                      BlocProvider.of<BottomSheetBloc>(context).add(
                          RepeatCycleEvent(
                              repeat: value,
                              onWhichDaysIfweeklu: DaysofWeek,
                              DatesForMonth: DatesForMonth));
                    },
                    activeColor: Colors.transparent,
                    thumbColor: MaterialStateProperty.resolveWith((states) {
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
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
                            whichOption="Daily";
                                BlocProvider.of<BottomSheetBloc>(context).add(
                                    RepeatCycleEvent(
                                        repeat: true,
                                        whichOption: "Daily",
                                        onWhichDaysIfweeklu: DaysofWeek,
                                        DatesForMonth: DatesForMonth));
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                          whichOption="Weekly";
                                BlocProvider.of<BottomSheetBloc>(context).add(
                                    RepeatCycleEvent(
                                        repeat: true,
                                        whichOption: "Weekly",
                                        onWhichDaysIfweeklu: DaysofWeek,
                                        DatesForMonth: DatesForMonth));
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                          whichOption="Monthly";
                                BlocProvider.of<BottomSheetBloc>(context).add(
                                    RepeatCycleEvent(
                                        repeat: true,
                                        whichOption: "Monthly",
                                        onWhichDaysIfweeklu: DaysofWeek,
                                        DatesForMonth: DatesForMonth));
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                    ),
                  ),
                  Visibility(
                      visible: option == "Weekly",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 15,
                            height: 40,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: daysOfWeekOnlyOneChar.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (DaysofWeek.contains(index)) {
                                          DaysofWeek.remove(index);
                                        } else {
                                          DaysofWeek.add(index);
                                        }
                                        BlocProvider.of<BottomSheetBloc>(
                                                context)
                                            .add(RepeatCycleEvent(
                                                repeat: true,
                                                whichOption: option,
                                                Frequency: false,
                                                onWhichDaysIfweeklu: DaysofWeek,
                                                DatesForMonth: DatesForMonth));
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 10,
                                        decoration: ShapeDecoration(
                                          color: DaysofWeek.contains(index)
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
                                                daysOfWeekOnlyOneChar[index])),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )),
                  Visibility(
                    visible: option == "Monthly",
                    child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 170,
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 10, // 7 columns for 7 days
                                    mainAxisExtent: 45),
                            itemCount: 31,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (DatesForMonth.contains(index + 1)) {
                                    DatesForMonth.remove(index + 1);
                                  } else {
                                    DatesForMonth.add(index + 1);
                                  }
                                  print(DatesForMonth);
                                  BlocProvider.of<BottomSheetBloc>(context)
                                      .add(RepeatCycleEvent(
                                    repeat: repeatCycle,
                                    onWhichDaysIfweeklu: DaysofWeek,
                                    DatesForMonth: DatesForMonth,
                                    whichOption: option,
                                    Frequency: numberPicker,
                                    numberPickervalue: numberPickerValue,
                                    setEndDate: setendDate,
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    decoration: ShapeDecoration(
                                        color: DatesForMonth.contains(index + 1)
                                            ? const Color(0xFF9D6BCE)
                                            : Colors.transparent,
                                        shape:
                                            const OvalBorder(eccentricity: 0)),
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                              ?.color,
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
                            })),
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
                                    BlocProvider.of<BottomSheetBloc>(context)
                                        .add(RepeatCycleEvent(
                                            repeat: true,
                                            whichOption: option,
                                            Frequency: !numberPicker,
                                            onWhichDaysIfweeklu: DaysofWeek,
                                            DatesForMonth: DatesForMonth));
                                  }
                                : () {},
                            child: Row(
                              children: [
                                Text(
                                  'Every ${whichOption2(optionName: option)}',
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
                      color: Theme.of(context).inputDecorationTheme.fillColor,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Every',
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
                                maxValue: option == "Weekly"
                                    ? 5
                                    : option == "Monthly"
                                        ? 12
                                        : 31,
                                value: numberPickerValue,
                                onChanged: (int value) {
                                  numberPickerValue = value;
                                  frequencyNumber = numberPickerValue;
                                  BlocProvider.of<BottomSheetBloc>(context).add(
                                      RepeatCycleEvent(
                                          repeat: true,
                                          whichOption: option,
                                          monthIndex: monthIndex,
                                          Frequency: numberPicker,
                                          setEndDate: setendDate,
                                          endDate: endDate,
                                          numberPickervalue: value,
                                          onWhichDaysIfweeklu: DaysofWeek,
                                          DatesForMonth: DatesForMonth));

                                  print(datesOnwhichTheHabbitsAreSet);
                                },
                              ),
                              Text(
                                whichOption2(optionName: option),
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
                    padding: const EdgeInsets.only(left: 25.0, right: 10),
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
                            setendDate = value;
                            BlocProvider.of<BottomSheetBloc>(context)
                                .add(RepeatCycleEvent(
                              repeat: true,
                              whichOption: option,
                              Frequency: numberPicker,
                              numberPickervalue: numberPickerValue,
                              setEndDate: value,
                              onWhichDaysIfweeklu: DaysofWeek,
                              DatesForMonth: DatesForMonth,
                            ));
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
                  Visibility(
                    visible: setendDate,
                    child: Column(
                      children: <Widget>[
                        // Row for the days of the week
                        BlocBuilder<BottomSheetBloc, BottomSheetState>(
                          builder: (context, state) {
                            String? monthname = DateFormat.MMMM()
                                .format(DateTime(2024, DateTime.now().month));
                            if (state is RepeatCycleState) {
                              monthname = DateFormat.MMMM()
                                  .format(DateTime(2024, state.monthIndex));
                            }
                            return Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      monthIndex=int.parse(
                                          (pageController.page!)
                                              .toStringAsFixed(0));
                                      BlocProvider.of<BottomSheetBloc>(context)
                                          .add(RepeatCycleEvent(
                                        repeat: true,
                                        whichOption: option,
                                        Frequency: numberPicker,
                                        onWhichDaysIfweeklu: DaysofWeek,
                                        DatesForMonth: DatesForMonth,
                                        numberPickervalue: numberPickerValue,
                                        setEndDate: setendDate,
                                        monthIndex: int.parse(
                                            (pageController.page!)
                                                .toStringAsFixed(0)),
                                      ));
                                      pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 10),
                                          curve: Curves.easeIn);
                                    },
                                    child: Icon(Icons.arrow_back_ios_rounded,
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.color),
                                  ),
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
                                  GestureDetector(
                                    onTap: () {
                                      monthIndex= int.parse(
                                          (pageController.page! + 1)
                                              .toStringAsFixed(0));
                                      BlocProvider.of<BottomSheetBloc>(context)
                                          .add(RepeatCycleEvent(
                                        repeat: true,
                                        whichOption: option,
                                        Frequency: numberPicker,
                                        onWhichDaysIfweeklu: DaysofWeek,
                                        DatesForMonth: DatesForMonth,
                                        numberPickervalue: numberPickerValue,
                                        setEndDate: setendDate,
                                              monthIndex: int.parse(
                                                  (pageController.page! + 1)
                                                      .toStringAsFixed(0)),



                                      ));
                                      pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 10),
                                          curve: Curves.easeIn);
                                    },
                                    child: Icon(Icons.arrow_forward_ios_rounded,
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.color),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Calendar View
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: PageView.builder(
                                controller: pageController,
                                itemCount: 12,
                                onPageChanged: (value) {
                                  monthIndex=value + 1;
                                  BlocProvider.of<BottomSheetBloc>(context).add(
                                      RepeatCycleEvent(
                                          repeat: true,
                                          whichOption: option,
                                          Frequency: numberPicker,
                                          numberPickervalue: numberPickerValue,
                                          setEndDate: setendDate,
                                          monthIndex: value + 1,
                                          onWhichDaysIfweeklu: DaysofWeek,
                                          DatesForMonth: DatesForMonth));
                                },
                                itemBuilder: (context, index) {
                                  return BlocBuilder<BottomSheetBloc,
                                      BottomSheetState>(
                                    builder: (context, state) {
                                      return MonthlyGridForEndDate(
                                        monthIndex: monthIndex-1<0?0:monthIndex-1,
                                      );
                                    },
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
