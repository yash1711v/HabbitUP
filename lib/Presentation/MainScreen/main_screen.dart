import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/More/more_bloc.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/Progress/progress_bloc.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/Progress/progress_screen.dart';
import 'package:HabitUp/Presentation/MainScreen/Pages/Routine/routine_bloc.dart';
import 'package:HabitUp/Presentation/MainScreen/main_screen_bloc.dart';


import '../../CommonMethods/Methods.dart';
import '../../CommonMethods/Variable.dart';
import '../../Widgets/BottomnavBar/bottom_Navbar.dart';
import 'Pages/More/more_screen.dart';
import 'Pages/Routine/routine_screen.dart';


class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    print('Value--->${Habbits["Custom"]}');

    return Scaffold(
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {

          if(state is MainScreenPageChangeState){
            // pageController.animateToPage(state.page, duration: const Duration(milliseconds: 700), curve: Curves.bounceOut);

            pageController.jumpToPage(state.page);
            Future.delayed(Duration(milliseconds: 8)).then((value) {
              if(state.page==1){
                BlocProvider.of<ProgressBloc>(contextProgress).add(Progresschangeevent(userhabitScreenController.UserHabit.value));

              }
            });

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
