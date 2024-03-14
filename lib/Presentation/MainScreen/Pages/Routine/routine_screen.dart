import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:habitup/MyTheme/theme_bloc.dart';
import 'package:habitup/Widgets/TipsofTheDay/tips_bloc.dart';
import 'package:habitup/Widgets/TipsofTheDay/tips_dialog_box.dart';

import '../../../../MyTheme/theme_event.dart';
import '../../../../Widgets/edit_avator.dart';
import '../../../../Widgets/horizontal_date.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 65),
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
                          BlocProvider.of<ThemeBloc>(context).add(ThemeSelectionEvent(context: context));
                        },
                        iconSize: 30,
                        icon: SvgPicture.asset("assets/ImagesY/RoutineScreen/BlackBellIcon.svg",
                          color: Theme.of(context).textTheme.titleMedium?.color,
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
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: HorizontalCalendar(),
        )
      ],
    );
  }
}
