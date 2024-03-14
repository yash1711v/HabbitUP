import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({Key? key}) : super(key: key);

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final ScrollController _scrollController = ScrollController();
  DateTime selectedDate = DateTime.now();

  final GlobalKey _rowKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineBloc, RoutineState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              HapticFeedback.lightImpact(); // Vibrate on scroll update
            }
            return false;
          },
          child: Column(
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
                height: 100,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 30, // Number of days to display
                  itemBuilder: (context, index) {
                    DateTime date = DateTime.now().add(Duration(days: index));
                    bool isToday = date.day == DateTime.now().day;



                    return GestureDetector(

                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });

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
          ),
        );
      },
    );
  }

}
