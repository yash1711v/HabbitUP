import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({super.key});

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime _selectedDate = DateTime.now();
  int slected = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          HapticFeedback.lightImpact(); // Vibrate on scroll update
        }
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 30, // Number of days to display
              itemBuilder: (context, index) {
                DateTime date = DateTime.now().add(Duration(days: index));
                bool isToday = date.day == DateTime.now().day;

                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        slected = index;
                        _scrollToSelectedIndex(index);
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            isToday
                                ? Center(
                                    child: Text(
                                      'TODAY',
                                      style: GoogleFonts.dmSans(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      DateFormat.d().format(date),
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 26,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToSelectedIndex(int index) {
    _scrollController.animateTo(
      index * 90.0, // Adjust according to your item width
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
