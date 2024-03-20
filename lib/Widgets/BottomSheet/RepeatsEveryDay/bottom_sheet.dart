
import 'package:flutter/material.dart';


import 'CustomDateFeature/custom_dates_feature.dart';
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
            CustomDateFeature(pageController2: _pageController2, pageController: _pageController, daysOfWeek: daysOfWeek,),
            RepeastFeatures(pageController2: _pageController2, pageController: _pageController, daysOfWeek: daysOfWeek,)
          ],
        ));
  }
}




