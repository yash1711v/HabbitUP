import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../CommonMethods/Variable.dart';
import '../Presentation/MainScreen/Pages/Routine/SubScreens/stacking_cards.dart';
import '../Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
class HorizontalCalendar extends StatefulWidget {
  BuildContext contextRoutineScreen;
  String whichState;
  HorizontalCalendar({required this.contextRoutineScreen,required this.whichState});

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {


  final GlobalKey _rowKey = GlobalKey();

  @override
  Widget build(BuildContext context2) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            key: _rowKey,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 95,
                height: 18,
                child: Text(
                  DateFormat('dd MMM, EEE').format(selectedDate),
                  style:  TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.color,
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 30, // Number of days to display
            itemBuilder: (context, index) {
              DateTime date = DateTime.now().add(Duration(days: index));
              bool isToday = date.day == DateTime.now().day;



              return GestureDetector(

                onTap: () {
                  setState(() {
                    fancyCards.clear();
                    selectedDate = date;
                    fancyCards=generateHabitCards(userHabit: UserHabit, state: whichState, selectedDate: selectedDate);
                  });


                  BlocProvider.of<RoutineBloc>(widget.contextRoutineScreen).add(ListchangeEvent(fancyCards: fancyCards,state: widget.whichState, habits: UserHabit));

                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Text(
                    isToday ? "TODAY" : DateFormat.d().format(date),
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        color:  selectedDate.day==date.day?Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.color:Colors.grey,
                        fontSize: 26,
                        fontFamily: 'DM Sans',
                        fontWeight:
                        selectedDate.day==date.day? FontWeight.w500 : FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}
