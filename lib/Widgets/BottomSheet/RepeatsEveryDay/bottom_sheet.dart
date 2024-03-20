
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/CommonMethods/Variable.dart';
import 'package:habitup/Widgets/BottomSheet/RepeatsEveryDay/MonthCalenderWithFoCustomDates/month_calender_for_custom_dates.dart';
import 'package:habitup/Widgets/BottomSheet/RepeatsEveryDay/bottom_sheet_bloc.dart';
import 'package:intl/intl.dart';

import 'RepeatFeatures/repeat_features.dart';

class BottomSheetCustom extends StatelessWidget {
  BottomSheetCustom({super.key});


  final currentMonth = DateTime.now().month;

 final PageController _pageController =
      PageController(initialPage: DateTime.now().month - 1);
 final PageController _pageController2 = PageController();

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
          physics: const NeverScrollableScrollPhysics(),
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
                          GestureDetector(
                            onTap:(){
                              BlocProvider.of<BottomSheetBloc>(context).add(MothChangeEvent(monthIndex: int.parse((_pageController.page)!.toStringAsFixed(0)), Datesare: datesOnwhichTheHabbitsAreSet));
                              _pageController.previousPage(duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
                             },
                            child: Icon(Icons.arrow_back_ios_rounded,
                                color:
                                    Theme.of(context).textTheme.displayLarge?.color),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                            onTap:(){
                              BlocProvider.of<BottomSheetBloc>(context).add(MothChangeEvent(monthIndex: int.parse((_pageController.page!+1).toStringAsFixed(0)), Datesare: datesOnwhichTheHabbitsAreSet));
                              _pageController.nextPage(duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color:
                                    Theme.of(context).textTheme.displayLarge?.color),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Row for the days of the week
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: daysOfWeek
                        .map((day) => Text(
                              day,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 5),
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
                              .add(MothChangeEvent(monthIndex: value + 1, Datesare: datesOnwhichTheHabbitsAreSet));
                        },
                        itemBuilder: (context, index) {
                          return BlocBuilder<BottomSheetBloc, BottomSheetState>(
                            builder: (context, state) {
                              return MonthlyGridView(
                                monthIndex: index,
                              );
                            },
                          );
                        }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextButton(
                    onPressed: () {
                      _pageController2.nextPage(
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Repeats every day',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge?.color,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Theme.of(context).textTheme.displayLarge?.color,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            RepeastFeatures(pageController2: _pageController2, pageController: _pageController, daysOfWeek: daysOfWeek,)
          ],
        ));
  }
}




