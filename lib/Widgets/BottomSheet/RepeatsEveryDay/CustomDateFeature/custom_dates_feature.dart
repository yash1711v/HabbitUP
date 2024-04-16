
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HabitUp/Widgets/BottomSheet/RepeatsEveryDay/MonthCalenderWithFoCustomDates/month_calender_for_custom_dates.dart';
import 'package:intl/intl.dart';

import '../../../../CommonMethods/Variable.dart';
import '../bottom_sheet_bloc.dart';

class CustomDateFeature extends StatelessWidget {
  final PageController pageController2;
  final PageController pageController;
  final List<String> daysOfWeek;
  const CustomDateFeature({super.key,required this.pageController2,required this.pageController,required this.daysOfWeek});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      BlocProvider.of<BottomSheetBloc>(context).add(MothChangeEvent(monthIndex: int.parse((pageController.page)!.toStringAsFixed(0)), Datesare: datesOnwhichTheHabbitsAreSet));
                      pageController.previousPage(duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
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
                      BlocProvider.of<BottomSheetBloc>(context).add(MothChangeEvent(monthIndex: int.parse((pageController.page!+1).toStringAsFixed(0)), Datesare: datesOnwhichTheHabbitsAreSet));
                      pageController.nextPage(duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
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
                controller: pageController,
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
              pageController2.nextPage(
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeIn);
            },
            child: Text(
              '${whichText(frequencyNumber,whichOption)}',
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
    );
  }
}
whichText(int frequency,String whichoption,){
  if(whichoption.isNotEmpty && whichoption!=null && frequency!=0){
     if(whichoption=="Daily"){
       return "Repeats every $frequency Day";
     }
     if(whichoption=="Weekly"){
       return "Repeats every $frequency Week";
     }
     if(whichoption=="Monthly"){
       return "Repeats every $frequency Month";
     }

     return "Allow Repetition";
  }
  return "Allow Repetition";
}