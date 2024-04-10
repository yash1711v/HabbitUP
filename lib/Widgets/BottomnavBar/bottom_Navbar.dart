import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitup/Presentation/MainScreen/main_screen_bloc.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

Widget bottomNavBar(BuildContext context) {
  return BlocBuilder<MainScreenBloc, MainScreenState>(
    builder: (context, state) {
      int i = 0;
      if (state is MainScreenPageChangeState) {
        i = state.page;
      }
      return StylishBottomBar(
        backgroundColor: Colors.black,
        currentIndex: i,
        hasNotch: true,
        onTap: (value) {
          HapticFeedback.lightImpact();
          BlocProvider.of<MainScreenBloc>(context).add(PageChangeEvent(Page: value));
        },
        items: [
          BottomBarItem(
              icon: SvgPicture.asset(
                  i==0?"assets/ImagesY/BottomNavigationIconImages/RoutineSelectedIcon.svg":"assets/ImagesY/BottomNavigationIconImages/RoutineIcon.svg"),
              title: const Text("Routine"),
              selectedColor: const Color(0xFFFEF656)),

          BottomBarItem(
              icon: SvgPicture.asset(
                  i==1?"assets/ImagesY/BottomNavigationIconImages/ProgressSlectedIcon.svg":"assets/ImagesY/BottomNavigationIconImages/ProgressIcon.svg"),
              title: const Text("Progress"),

              selectedColor: const Color(0xFFFEF656)),

          BottomBarItem(
              icon: SvgPicture.asset(
                  i==2?"assets/ImagesY/SettingsScreen/SettingIconActive.svg":"assets/ImagesY/SettingsScreen/SettingsIcon.svg"),
              title: const Text("Settings"),
              selectedColor: const Color(0xFFFEF656))
        ],
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
      );
    },
  );
}
