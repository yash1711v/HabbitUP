import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:HabitUp/CommonMethods/Variable.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habit_adision_bloc.dart';
import 'package:HabitUp/Widgets/BottomSheet/Duration/duration_bloc.dart';
import 'package:intl/intl.dart';

import '../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/CustomHabitAdission.dart';
import '../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/CustomHabit/custom_habit_bloc.dart';

class DurationOfHabit extends StatelessWidget {
  int index=0;
  BuildContext habitAddisionContext;
  bool newCreating;
   DurationOfHabit({super.key,required this.index,required this.habitAddisionContext,this.newCreating=false});

  @override
  Widget build(BuildContext context) {
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
      child: BlocBuilder<DurationBloc, DurationState>(
        builder: (context, state) {
          if(state is SetTimeState){
            durationOfHabit=state.settingTime;
            setEndTime=state.settingEndTime;
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
                            BlocProvider.of<DurationBloc>(context).add(SetTimeEvent(settingTime: false));
                            if(newCreating){
                              properties[index]="Time: All Day";
                              BlocProvider.of<CustomHabitBloc>(
                                  habitAddisionContext)
                                  .add(SelectedColorEventCustom(
                                properties: properties,
                              ));
                            }else
                            {
                              Properties[index] = "Time: All Day";
                              BlocProvider.of<HabitAdisionBloc>(habitAddisionContext).add(SelectedColorEvent(SelectedIndex: SelectedIndex,properties: Properties,
                                name: selectedHabit,
                                icon: SelectedHabitIcon,
                                target: target, Subtasks: Subtasks,
                              ));
                            }
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          )),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 700),
                        opacity: durationOfHabit?1:0,
                        child: Visibility(
                          visible: durationOfHabit,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                time="$startTime-${adjustTime(startTime, endTime)}";
                                endTime=adjustTime(startTime, endTime);
                                print("$time");
                                if(newCreating){
                                  properties[index]="Time: $time";
                                  BlocProvider.of<CustomHabitBloc>(
                                      habitAddisionContext)
                                      .add(SelectedColorEventCustom(
                                    properties: properties,
                                  ));
                                }else
                                {
                                  Properties[index] = "Time: $time";
                                  BlocProvider.of<HabitAdisionBloc>(habitAddisionContext).add(SelectedColorEvent(SelectedIndex: SelectedIndex,properties: Properties,
                                    name: selectedHabit,
                                    icon: SelectedHabitIcon,
                                    target: target, Subtasks: Subtasks,
                                  ));
                                }

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
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: .0, left: 25, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 142,
                        height: 24,
                        child: Text(
                          'Set Time',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Switch(
                        value: durationOfHabit,
                        onChanged: (value) {

                          BlocProvider.of<DurationBloc>(context).add(SetTimeEvent(settingTime: value));
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
                AnimatedOpacity(
                  duration: Duration(milliseconds: 700),
                  opacity: durationOfHabit?1:0,
                  child:   Visibility(
                    visible: durationOfHabit,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TimePickerSpinner(
                            is24HourMode: false,
                            onTimeChange: (time){
                              String formattedTime = DateFormat('hh:mm a').format(time);
                              startTime=formattedTime;
                              print("$formattedTime");
                            },
                            highlightedTextStyle: const TextStyle(
                              color: const Color(0xFF9D6BCE),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                            normalTextStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                            isForce2Digits: true,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: Divider(
                            color: Theme.of(context).inputDecorationTheme.fillColor,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: .0, left: 25, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 142,
                                height: 24,
                                child: Text(
                                  'Set End time',
                                  style: TextStyle(
                                    color:
                                    Theme.of(context).textTheme.displayLarge?.color,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Switch(
                                value: setEndTime,
                                onChanged: (value) {

                                  BlocProvider.of<DurationBloc>(context).add(SetTimeEvent(settingTime: durationOfHabit,settingEndTime: value));
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
                        AnimatedOpacity(opacity: setEndTime?1:0, duration: Duration(milliseconds: 700),
                          child: Visibility(
                            visible: setEndTime,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: TimePickerSpinner(
                                is24HourMode: false,
                                onTimeChange: (time){
                                  String formattedTime = DateFormat('hh:mm a').format(time);
                                  endTime=formattedTime;
                                  print("$formattedTime");
                                },
                                highlightedTextStyle: const TextStyle(
                                  color: const Color(0xFF9D6BCE),
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                                normalTextStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                                isForce2Digits: true,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 55,)
              ],
            ),
          );
        },
      ),
    );
  }
}
String adjustTime(String startTime, String endTime) {
  DateFormat format = DateFormat('h:mm a');
  if (endTime.isEmpty) {
    // Parsing startTime to DateTime
    DateTime startDateTime = format.parse(startTime);

    // Adding 30 minutes to startDateTime
    DateTime adjustedTime = startDateTime.add(Duration(minutes: int.parse(target)));

    // Formatting adjusted time back to 'h:mm a' format
    return format.format(adjustedTime);
  }
  // Return the endTime if it's not empty
  return endTime;
}