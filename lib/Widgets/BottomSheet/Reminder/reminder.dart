import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Widgets/BottomSheet/Reminder/reminder_bloc.dart';
import 'package:intl/intl.dart';

import '../../../Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habit_adision_bloc.dart';

class Reminder extends StatelessWidget {
  int index = 0;
  BuildContext habitAddisionContext;
  Reminder(
      {super.key, required this.index, required this.habitAddisionContext});

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
      child: BlocBuilder<ReminderBloc, ReminderState>(
        builder: (context, state) {
          DateTime SettedTime = DateTime.now();
          if (state is ReminderStates) {
            SetReminder = state.SetReminder;
            Reminders = state.Reminders;
            print(state.time);
            addedTime = state.time;
          }
          print(addedTime);
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
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          )),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 700),
                        opacity: SetReminder ? 1 : 0,
                        child: Visibility(
                          visible: SetReminder,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                time = Reminders.length > 1
                                    ? "Reminders: Multiple"
                                    : "Reminder: ${Reminders.first}";
                                print("$time");
                                Properties[index] = "$time";
                                BlocProvider.of<HabitAdisionBloc>(
                                        habitAddisionContext)
                                    .add(SelectedColorEvent(
                                        SelectedIndex: SelectedIndex,
                                        properties: Properties));
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
                          '${whichReminder(Reminders)}',
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
                        value: SetReminder,
                        onChanged: (value) {
                          BlocProvider.of<ReminderBloc>(context).add(
                              ReminderEvents(
                                  SetReminder: value,
                                  Reminders: Reminders,
                                  time: SettedTime));
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
                  opacity: SetReminder ? 1 : 0,
                  child: Visibility(
                    visible: SetReminder,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TimePickerSpinner(
                            key: ValueKey(addedTime),
                            time: addedTime,
                            is24HourMode: false,
                            onTimeChange: (time) {
                              String formattedTime =
                                  DateFormat('hh:mm a').format(time);
                              ReminderAt = formattedTime.trim();
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Divider(
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: .0, left: 25, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 142,
                                height: 24,
                                child: Text(
                                  'Multiple reminder',
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
                              IconButton(
                                onPressed: () {
                                  Reminders.add(ReminderAt);
                                  print(Reminders);
                                  // Get the current date

                                  DateTime reminderTime =
                                      DateFormat("hh:mm a").parse(ReminderAt);

// Get the current date
                                  DateTime currentDate = DateTime.now();

// Extract the current year and month
                                  int currentYear = currentDate.year;
                                  int currentMonth = currentDate.month;

// Create a new DateTime object with the current date, month, and the time from the parsed DateTime
                                  addedTime = DateTime(
                                    currentYear,
                                    currentMonth,
                                    currentDate.day, // Use current day
                                    reminderTime.hour,
                                    reminderTime.minute + 10,
                                  );

// Format the DateTime object into a string in "hh:mm a" format
                                  String formattedTime =
                                      DateFormat("hh:mm a").format(addedTime);

                                  print(formattedTime);
                                  BlocProvider.of<ReminderBloc>(context).add(
                                      ReminderEvents(
                                          SetReminder: SetReminder,
                                          Reminders: Reminders,
                                          time: DateFormat("hh:mm a")
                                              .parse(formattedTime)));
                                },
                                icon: Icon(Icons.add_circle_rounded),
                                color: Color(0xFFFEF656),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: Reminders.length > 1 ? 1 : 0,
                  duration: Duration(milliseconds: 700),
                  child: Visibility(
                    visible: Reminders.length > 1 ,
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6, // 7 columns for 7 days
                          mainAxisExtent: 38,
                        crossAxisSpacing: 5

                      ),

                      itemCount: Reminders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: ShapeDecoration(
                            color: Color(0xFF292929),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                            ),
                          ),
                          child: Text(
                            "${Reminders.elementAt(index)}"
                          ),
                        );
                      },

                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                )
              ],
            ),
          );
        },
      ),
    );
    ;
  }
}

whichReminder(Set<String> ReminderNumber) {
  if (ReminderNumber.length >= 1) {
    return "Set Reminder ${ReminderNumber.length + 1}";
  } else {
    return "Set Reminder";
  }
}
