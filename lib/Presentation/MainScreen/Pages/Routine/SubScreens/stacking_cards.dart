import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habbit_addision_%20screen.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../../../../CommonMethods/Variable.dart';
import '../../../../../FirebaseFunctionality/DatabaseFeatures.dart';
import '../../../../../LocalStorage/SharedPref/Sharedpref.dart';
import '../../../../../Widgets/DialogBox/Logsadition/logs_adition.dart';
import '../../Progress/progress_bloc.dart';

class StackingCard extends StatefulWidget {
  final DateTime date;
  const StackingCard({super.key, required this.date});

  @override
  State<StackingCard> createState() => _StackingCardState();
}

class _StackingCardState extends State<StackingCard> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineBloc, RoutineState>(
      builder: (context, state) {
        if (state is ListchangeState) {
          fancyCards = state.fancyCards;
        }
        return fancyCards.isNotEmpty
            ? StackedCardCarousel(
                pageController: controller,
                initialOffset: -00,
                type: StackedCardCarouselType.cardsStack,
                spaceBetweenItems: 150,
                items: fancyCards,
              )
            : const Padding(
                padding: EdgeInsets.only(left: 165.0, top: 350),
                child: Text("No Habits for today"),
              );
      },
    );
  }
}

class FancyCard extends StatefulWidget {
  const FancyCard({
    super.key,
    required this.Habitname,
    required this.starttime,
    required this.endtime,
    required this.Hastag,
    required this.Subtask,
    required this.icon,
    required this.color,
    required this.units,
    required this.target,
    required this.category,
    required this.index,
    required this.done,
    required this.value,
  });

  final String Habitname;
  final String starttime;
  final String endtime;
  final String Hastag;
  final Color color;
  final List<String> Subtask;
  final String icon;
  final String units;
  final String target;
  final String category;
  final int index;
  final bool done;
  final int value;

  @override
  State<FancyCard> createState() => _FancyCardState();
}

class _FancyCardState extends State<FancyCard> {
  Map<String, int> val = generateDateMapProgress();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 155,
      child: Stack(
        children: [
          Container(
              width: 400,
              height: 155,
              decoration: ShapeDecoration(
                color: widget.color,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25,
                                child: Text(
                                  insertLineBreaks(widget.starttime),
                                  style: const TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    letterSpacing: 0.48,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "|",
                                  style: TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                child: Text(
                                  insertLineBreaks(widget.endtime),
                                  style: const TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    letterSpacing: 0.48,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0, left: 5),
                                child: Text(
                                  'Evening',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 10,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                    letterSpacing: 0.30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 280,
                                child: Text(
                                  '${widget.Habitname}',
                                  style: const TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 40,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    letterSpacing: 0.40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, right: 5),
                child: SvgPicture.asset(
                  "${widget.icon}",
                  color: const Color(0x271F1F1F),
                ),
              ),
              Container(
                width: 57,
                height: 155,
                decoration: ShapeDecoration(
                  color: Theme.of(context).textTheme.titleMedium?.color,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
                child: Container(
                  width: 57,
                  height: 155,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                              child: GestureDetector(
                                  onTap: () async {
                                    if (widget.value! < int.parse(target)) {
                                      int v = widget.value + 1;
                                      String Uid=await Sharedpref().getUid();

                                      for (int i = 0;
                                          i <
                                              userhabitScreenController
                                                  .UserHabit
                                                  .value[widget.category]
                                                  .length;
                                          i++) {
                                        if (userhabitScreenController
                                            .UserHabit.value[widget.category][i]
                                            .containsKey(widget.Habitname)) {

                                          setState(() {
                                            userhabitScreenController
                                                .UserHabit
                                                .value[widget.category][i]
                                                    [widget.Habitname]
                                                    ['Progress']
                                                .update(
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(selectedDate),
                                                    (value) => v);
                                          });
                                          setState(() {
                                            fancyCards = generateHabitCards(
                                                userHabit:
                                                    userhabitScreenController
                                                        .UserHabit.value,
                                                state: whichState,
                                                selectedDate: selectedDate);
                                          });
                                          Sharedpref().saveData(
                                              userhabitScreenController
                                                  .UserHabit.value);

                                          await Sharedpref().loadData().then((value) {
                                            DatabaseFeatures().updateUserhabits(UserHabits: value, Uid: Uid);




                                          });
                                          BlocProvider.of<RoutineBloc>(
                                              contextRoutineScreen)
                                              .add(ListchangeEvent(
                                              fancyCards: fancyCards,
                                              state: whichState,
                                              habits:
                                              userhabitScreenController
                                                  .UserHabit.value));
                                          BlocProvider.of<ProgressBloc>(
                                              contextProgress)
                                              .add(Progresschangeevent(
                                              userhabitScreenController
                                                  .UserHabit.value));
                                        } else if (val == int.parse(target)) {
                                          userhabitScreenController
                                              .UserHabit
                                              .value[widget.category][i]
                                                  [widget.Habitname]['Progress']
                                              .putIfAbsent(
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(selectedDate),
                                                  () => 0);
                                          userhabitScreenController
                                              .UserHabit
                                              .value[widget.category][i]
                                                  [widget.Habitname]['Progress']
                                              .update(
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(selectedDate),
                                                  (value) => int.parse(target));

                                          userhabitScreenController
                                              .UserHabit
                                              .value[widget.category][i]
                                                  [widget.Habitname]
                                                  ['Completed']
                                              .update(
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(selectedDate),
                                                  (value) => true);

                                          setState(() {
                                            fancyCards = generateHabitCards(
                                                userHabit:
                                                    userhabitScreenController
                                                        .UserHabit.value,
                                                state: whichState,
                                                selectedDate: selectedDate);
                                          });
                                          Sharedpref().saveData(
                                              userhabitScreenController
                                                  .UserHabit.value);
                                          String Uid=await Sharedpref().getUid();
                                          await Sharedpref().loadData().then((value) {
                                            DatabaseFeatures().updateUserhabits(UserHabits: value, Uid: Uid);
                                          });
                                          BlocProvider.of<RoutineBloc>(
                                                  contextRoutineScreen)
                                              .add(ListchangeEvent(
                                                  fancyCards: fancyCards,
                                                  state: whichState,
                                                  habits:
                                                      userhabitScreenController
                                                          .UserHabit.value));
                                        }
                                      }
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    'assets/ImagesY/RoutineScreen/Addition.svg',
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ))),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 10),
                            child: SizedBox(
                              width: 57,
                              height: 24,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      '${widget.value}/$target\n${widget.units}',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fontSize: 20,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        height: .8,
                                        letterSpacing: 0.78,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Center(
                              child: GestureDetector(
                                  onTap: () async {
                                    if (val != 0) {
                                      int v = 0;

                                      v = widget.value - 1<0?0:widget.value - 1;
                                      for (int i = 0;
                                          i <
                                              userhabitScreenController
                                                  .UserHabit
                                                  .value[widget.category]
                                                  .length;
                                          i++) {
                                        if (userhabitScreenController
                                            .UserHabit.value[widget.category][i]
                                            .containsKey(widget.Habitname)) {
                                          setState(() {
                                            userhabitScreenController
                                                .UserHabit
                                                .value[widget.category]
                                            [i][widget.Habitname]
                                            ['Progress']
                                                .putIfAbsent(
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate),
                                                    () => 0);
                                            userhabitScreenController
                                                .UserHabit
                                                .value[widget.category]
                                            [i][widget.Habitname]
                                            ['Progress']
                                                .update(
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate),
                                                    (value) => v);
                                          });
                                          setState(() {
                                            fancyCards = generateHabitCards(
                                                userHabit: userhabitScreenController
                                                    .UserHabit.value,
                                                state: whichState,
                                                selectedDate: selectedDate);
                                          });
                                          String Uid=await Sharedpref().getUid();
                                          Sharedpref().saveData(
                                              userhabitScreenController
                                                  .UserHabit.value);

                                          await Sharedpref().loadData().then((value) {
                                            DatabaseFeatures().updateUserhabits(UserHabits: value, Uid: Uid);




                                          });

                                          BlocProvider.of<RoutineBloc>(
                                              contextRoutineScreen)
                                              .add(ListchangeEvent(
                                              fancyCards: fancyCards,
                                              state: whichState,
                                              habits: userhabitScreenController
                                                  .UserHabit.value));
                                          BlocProvider.of<ProgressBloc>(
                                              contextProgress)
                                              .add(Progresschangeevent(
                                              userhabitScreenController
                                                  .UserHabit.value));

                                        }
                                      }


                                    }
                                  },
                                  child: SvgPicture.asset(
                                    'assets/ImagesY/RoutineScreen/Subtract.svg',
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ))),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 365,
                height: 32,
                padding: const EdgeInsets.only(
                    top: 9, left: 32, right: 46, bottom: 9),
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  color: Color(0x191F1F1F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(44),
                      bottomLeft: Radius.circular(44),
                    ),
                  ),
                ),
                child: Container(
                  width: 191,
                  height: 14,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: SvgPicture.asset(
                                "assets/ImagesY/RoutineScreen/TagSmallIcon.svg",
                                width: 10,
                                height: 10,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${widget.Hastag}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: SvgPicture.asset(
                                "assets/ImagesY/RoutineScreen/AddSubtask.svg",
                                width: 10,
                                height: 10,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${widget.Subtask.length} sub task',
                              style:  TextStyle(
                                color: (widget.Subtask.length<=0)?Color(0x7F1F1F1F):Colors.black,
                                fontSize: 10,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Container(
                      width: 48,
                      height: 48,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return LogsAdition(callback: (String log) async {
                                    for (int i = 0; i < userhabitScreenController.UserHabit.value[widget.category].length; i++){

                                      if (userhabitScreenController
                                          .UserHabit.value[widget.category][i]
                                          .containsKey(widget.Habitname)){

                                        setState(() {
                                          userhabitScreenController
                                              .UserHabit
                                              .value[widget.category][i]
                                          [widget.Habitname]["logs"]..update(
                                              DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate),
                                                  (value) => log);



                                          userhabitScreenController
                                              .UserHabit
                                              .value[widget.category][i]
                                          [widget.Habitname]['Completed']
                                              .update(
                                              DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate),
                                                  (value) => !userhabitScreenController
                                                  .UserHabit
                                                  .value[widget.category]
                                              [i]
                                              [widget.Habitname]['Completed'][
                                              DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate)]);
                                          userhabitScreenController
                                              .UserHabit
                                              .value[widget.category]
                                          [i][widget.Habitname]
                                          ['Progress']
                                              .update(
                                              DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate),
                                                  (value) => int.parse(userhabitScreenController
                                                  .UserHabit
                                                  .value[widget.category]
                                              [i][widget.Habitname]
                                              ['target']));

                                          // done= UserHabit[widget.category][widget.index][widget.Habitname]['Completed'][DateFormat('dd-MM-yyyy').format(selectedDate)];
                                        });

                                        setState(() {
                                          fancyCards = generateHabitCards(
                                              userHabit: userhabitScreenController
                                                  .UserHabit.value,
                                              state: whichState,
                                              selectedDate: selectedDate);
                                        });
                                        Sharedpref().saveData(
                                            userhabitScreenController.UserHabit.value);
                                        String Uid=await Sharedpref().getUid();

                                        await Sharedpref().loadData().then((value) {
                                          print(value.length);

                                          value.forEach((key, value2) {
                                            value2.forEach((value3) {
                                              value3.forEach((key4, value4) {
                                                print(
                                                    '$key4:  valuee ${value4['Completed']}');
                                                value4['Completed']
                                                    .forEach((key5, value5) {
                                                  if (key5 ==
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(selectedDate)) {
                                                    print("matched $value5");
                                                    // done[DateFormat('dd-MM-yyyy')
                                                    //     .format(selectedDate)]=value5;
                                                  }
                                                });
                                              });
                                            });
                                          });
                                          DatabaseFeatures().updateUserhabits(UserHabits: value, Uid: Uid);

                                        });
                                        BlocProvider.of<RoutineBloc>(contextRoutineScreen)
                                            .add(ListchangeEvent(
                                            fancyCards: fancyCards,
                                            state: whichState,
                                            habits: userhabitScreenController
                                                .UserHabit.value));
                                        BlocProvider.of<ProgressBloc>(contextProgress)
                                            .add(Progresschangeevent(
                                            userhabitScreenController
                                                .UserHabit.value));


                                      }

                                    }

                                  },); // Show the dialog
                                },
                              );



                            },
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: ShapeDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 41,
                                height: 41,
                                decoration: ShapeDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 3, color: widget.color),
                                  ),
                                ),
                                child: Visibility(
                                  visible: widget.done,
                                  //done[DateFormat('dd-MM-yyyy').format(selectedDate)]==true??true,
                                  //UserHabit[widget.category][widget.index][widget.Habitname]['Completed'][DateFormat('dd-MM-yyyy').format(selectedDate)],
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/ImagesY/RoutineScreen/HbitDonemark.svg",
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

List<Widget> generateHabitCards(
    {required Map<String, dynamic> userHabit,
    required String state,
    required DateTime selectedDate}) {
  List<Widget> habitCards = [];
  print(state);
  userHabit.forEach((category, habits) {
    // print("category $category and habits $habits");
    List<String> Subtasks = [];
    habits.forEach((habit) {
      // print("habit $habit");
      habit.forEach((key1, value1) {
        // print("key $key1, \n value $value1 \n ");
        value1['Subtasks'].forEach((element) {
          // print("in subtask");
          Subtasks.clear();
          Subtasks.add(element.toString());
        });
        if (value1['dates']
            .containsKey(DateFormat('MMMM').format(selectedDate))) {
          print("have the current month ${value1['dates']}");
          for (int i = 0;
              i <
                  value1['dates'][DateFormat('MMMM').format(selectedDate)]
                      .length;
              i++) {
            print(value1['dates'][DateFormat('MMMM').format(selectedDate)][i]);
            if (value1['dates'][DateFormat('MMMM').format(selectedDate)][i]
                    .toString() ==
                selectedDate.day.toString()) {

              if(state=="Done"){
                 value1['Completed'].forEach((key,value5){
                   if(key==DateFormat('dd-MM-yyyy')
                       .format(selectedDate)){
                     if(value5){
                       habitCards.add(FancyCard(
                           Habitname: key1,
                           starttime: value1['startTime'] ?? "0000",
                           endtime: value1['endTime'] ?? "0000",
                           Hastag: value1['Hastag'] ?? "Tag",
                           Subtask: Subtasks,
                           icon: value1['icon'],
                           color: convertToColor(value1['colors']),
                           units: value1['changableunits'],
                           target: value1['target'],
                           category: category,
                           index: i,
                           done: value1['Completed']
                           [DateFormat('dd-MM-yyyy').format(selectedDate)],
                           value: value1['Progress']
                           [DateFormat('dd-MM-yyyy').format(selectedDate)]));
                     }
                   }
                 });

              } if(state=="Active"){
                 value1['Completed'].forEach((key,value5){
                   if(key==DateFormat('dd-MM-yyyy')
                       .format(selectedDate)){
                     if(!value5){
                       habitCards.add(FancyCard(
                           Habitname: key1,
                           starttime: value1['startTime'] ?? "0000",
                           endtime: value1['endTime'] ?? "0000",
                           Hastag: value1['Hastag'] ?? "Tag",
                           Subtask: Subtasks,
                           icon: value1['icon'],
                           color: convertToColor(value1['colors']),
                           units: value1['changableunits'],
                           target: value1['target'],
                           category: category,
                           index: i,
                           done: value1['Completed']
                           [DateFormat('dd-MM-yyyy').format(selectedDate)],
                           value: value1['Progress']
                           [DateFormat('dd-MM-yyyy').format(selectedDate)]));
                     }
                   }
                 });

              }
              if(state=="All"){



                habitCards.add(FancyCard(
                    Habitname: key1,
                    starttime: value1['startTime'] ?? "0000",
                    endtime: value1['endTime'] ?? "0000",
                    Hastag: value1['Hastag'] ?? "Tag",
                    Subtask: Subtasks,
                    icon: value1['icon'],
                    color: convertToColor(value1['colors']),
                    units: value1['changableunits'],
                    target: value1['target'],
                    category: category,
                    index: i,
                    done: value1['Completed']
                    [DateFormat('dd-MM-yyyy').format(selectedDate)],
                    value: value1['Progress']
                    [DateFormat('dd-MM-yyyy').format(selectedDate)]));

              }

            }
          }
        }
      });
    });
  });
  print("habit cards in  method ${habitCards}");
  return habitCards;
}

String insertLineBreaks(String input) {
  if (input == "0000") {
    return "00\n00";
  } else {
    // Check if input matches time format "hh:mm AM/PM"
    RegExp timeRegex = RegExp(r'^(\d{1,2}):(\d{2})\s(AM|PM)$');
    if (timeRegex.hasMatch(input)) {
      // Parse the time string
      List<String> parts = input.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1].split(' ')[0]);
      String period = parts[1].split(' ')[1];

      // Convert to 24-hour format
      if (period.toUpperCase() == 'PM' && hour != 12) {
        hour += 12;
      } else if (period.toUpperCase() == 'AM' && hour == 12) {
        hour = 0;
      }
      print(
          '${hour.toString().padLeft(2, '0')}\n${minute.toString().padLeft(2, '0')}');
      // Construct the result string with line breaks
      return '${hour.toString().padLeft(2, '0')}\n${minute.toString().padLeft(2, '0')}';
    } else {
      // Return empty string or handle invalid input as needed
      return '';
    }
  }
}

Color convertToColor(String colorString) {
  return Color(int.parse(colorString.replaceAll('0x', ''), radix: 16));
}
