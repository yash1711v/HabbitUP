import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/More/more_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Progress/progress_bloc.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Progress/progress_screen.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:habitup/Presentation/MainScreen/main_screen_bloc.dart';


import '../../Widgets/BottomnavBar/bottom_Navbar.dart';
import 'Pages/More/more_screen.dart';
import 'Pages/Routine/routine_screen.dart';


class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {

          if(state is MainScreenPageChangeState){
            pageController.animateToPage(state.page, duration: const Duration(milliseconds: 700), curve: Curves.bounceOut);
            // pageController.jumpToPage(state.page);
          }
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
           onPageChanged: (value){
             HapticFeedback.lightImpact();
           },
            controller: pageController,
            children: [
              BlocProvider(
                create: (context) => RoutineBloc(),
                child: const RoutineScreen(),
              ),
              BlocProvider(
                create: (context) => ProgressBloc(),
                child: const ProgressScreen(),
              ),
              BlocProvider(
                create: (context) => MoreBloc(),
                child: const MoreScreen(),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
