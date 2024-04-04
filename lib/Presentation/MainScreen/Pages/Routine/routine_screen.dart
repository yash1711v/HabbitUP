import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/MyTheme/theme_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:habitup/Widgets/TipsofTheDay/tips_bloc.dart';
import 'package:habitup/Widgets/TipsofTheDay/tips_dialog_box.dart';

import '../../../../MyTheme/theme_event.dart';
import '../../../../Widgets/edit_avator.dart';
import '../../../../Widgets/horizontal_date.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import 'SubScreens/stacking_cards.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fancyCards = generateHabitCards(
        userHabit: userhabitScreenController.UserHabit.value,
        state: whichState,
        selectedDate: selectedDate);


    contextRoutineScreen= context;
    Future.delayed(Duration(milliseconds: 10)).then((value) {
      BlocProvider.of<RoutineBloc>(context).add(
          ListchangeEvent(fancyCards: fancyCards, state: whichState, habits: userhabitScreenController.UserHabit.value));
    });

  }
  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onDoubleTap: () {
                      HapticFeedback.lightImpact();
                      EditAvator(context);
                    },
                    child: FluttermojiCircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Theme.of(context).textTheme.titleMedium?.color,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Stack(children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ThemeSelectionEvent(context: context));
                          },
                          iconSize: 30,
                          icon: SvgPicture.asset(
                            "assets/ImagesY/RoutineScreen/BlackBellIcon.svg",
                            color:
                                Theme.of(context).textTheme.titleMedium?.color,
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 25),
                            child: Container(
                              width: 5.47,
                              height: 5.37,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFFF0000),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => TipsBloc(),
                              child: Tips(),
                            ); // Show the dialog
                          },
                        );
                      },
                      icon: Image.asset(
                        "assets/ImagesY/RoutineScreen/TipIg.png",
                        width: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pushNamed("/AddHabitScreen");
                        },
                        icon: SvgPicture.asset(
                          "assets/ImagesY/RoutineScreen/PlusIcon.svg",
                          color: Theme.of(context).textTheme.titleMedium?.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: BlocBuilder<RoutineBloc, RoutineState>(
              builder: (context, state) {
                return HorizontalCalendar(
                  contextRoutineScreen: context,
                  whichState: whichState,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25,top: 10),
            child: BlocBuilder<RoutineBloc, RoutineState>(
              builder: (context, Statee) {

                if (Statee is ListchangeState) {
                  whichState = Statee.state;
                }
                return Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          whichState= "All";
                          fancyCards = generateHabitCards(userHabit: userhabitScreenController.UserHabit.value, state: whichState, selectedDate: selectedDate);
                          BlocProvider.of<RoutineBloc>(context).add(
                              ListchangeEvent(
                                  fancyCards: fancyCards, state: "All", habits: userhabitScreenController.UserHabit.value));
                        },
                        child: Text(
                          "All",
                          style: whichState == "All"
                              ? TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                )
                              : TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                          onTap: () {
                            whichState= "Active";
                            fancyCards = generateHabitCards(userHabit: userhabitScreenController.UserHabit.value, state: whichState, selectedDate: selectedDate);
                            BlocProvider.of<RoutineBloc>(context).add(
                                ListchangeEvent(
                                    fancyCards: fancyCards, state: "Active", habits: userhabitScreenController.UserHabit.value));
                          },
                          child: Text(
                            "Active",
                            style: whichState == "Active"
                                ? TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.color,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  )
                                : TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                          )),
                    ),
                    GestureDetector(
                        onTap: () {
                          whichState= "Done";
                          fancyCards = generateHabitCards(userHabit: userhabitScreenController.UserHabit.value, state: whichState, selectedDate: selectedDate);
                          BlocProvider.of<RoutineBloc>(context).add(
                              ListchangeEvent(
                                  fancyCards: fancyCards, state: "Done", habits: userhabitScreenController.UserHabit.value));
                        },
                        child: Text(
                          "Done",
                          style: whichState == "Done"
                              ? TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                )
                              : TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                        )),
                  ],
                );
              },
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.only(right: 0.0, top: 15),
                child: StackingCard(
                  date: selectedDate,
                ),
              )),
        ],
      ),
    );
  }
}
