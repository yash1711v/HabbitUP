import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitup/Presentation/MainScreen/Pages/Routine/SubScreens/AddHabit/SubScreenOfAddHabit/HabbitAddisionScreen/habit_adision_bloc.dart';

class HabbitAddisionScreen extends StatelessWidget {
  const HabbitAddisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitAdisionBloc, HabitAdisionState>(
      builder: (context, state) {
        int SelectedIndex = 0;
        List<Color> colors = [
          const Color(0xFF9D6BCE),
          const Color(0xFFF36C00),
          const Color(0xFFA8E32C),
          const Color(0xFF01BBF6),
          const Color(0xFFD03C91),
          const Color(0xFFFEF656),
          const Color(0xFFCE9FC3),
          const Color(0xFFF69140),
          const Color(0xFFCCF379),
          const Color(0xFF9EB8DD),
          const Color(0xFFFDD7F0),
          const Color(0xFFF5EDC9),
        ];
        List<bool> isSelected = List.generate(
            12,
            (index) =>
                index == 0 ? true : false); // List to track selected state
        if (state is SelectedColorState) {
          isSelected =
              List.generate(12, (index) => index == state.index ? true : false);
          SelectedIndex = state.index;
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2?.color,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: Icon(
                  Icons.man,
                  size: 50,
                  color: colors[SelectedIndex],
                )),
              ),
              const Text(
                "Exercise",
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 380,
                  height: 120,
                  child: GridView.count(
                    crossAxisCount: 6,
                    children: List.generate(12, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<HabitAdisionBloc>(context)
                                .add(SelectedColorEvent(SelectedIndex: index));
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                            ),
                            child: isSelected[index]
                                ? const Icon(Icons.check,
                                    color: Colors.black,
                                    size: 20) // Display check icon if selected
                                : null, // Display nothing if not selected,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 31.0),
                child: Container(
                  width: 319,
                  height: 268,
                  child: ListView.builder(
                    itemCount: 4, // Assuming you have 5 containers
                    itemBuilder: (context, index) {
                      // Determine the decoration based on the index
                      Decoration decoration;
                      if (index == 0) {
                        decoration =  BoxDecoration(
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .fillColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        );
                      } else if (index == 3) {
                        decoration =  BoxDecoration(
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .fillColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        );
                      } else {
                        decoration =  BoxDecoration(
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .fillColor,
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(top: 0.5),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            width: 319,
                            height: 42,
                            clipBehavior: Clip.antiAlias,
                            decoration: decoration,

                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: 314,
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Theme.of(context)
                      .inputDecorationTheme
                      .fillColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  width: 282,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 174,
                        height: 24,
                        child: Text(
                          'Add Subtask',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 84),
                      Container(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset("assets/ImagesY/RoutineScreen/PlusIcon.svg",fit: BoxFit.fitHeight,
                          width: 20,
                          color: Theme.of(context)
                              .textTheme
                              .headline1?.color,),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: 314,
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFEF656),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Container(
                    width: 282,
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 174,
                          height: 24,
                          child: Text(
                            'Invite a Habit Buddy',
                            style: TextStyle(
                              color: Color(0xFF1F1F1F),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 84),
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: SvgPicture.asset("assets/ImagesY/RoutineScreen/AddhabbitIcons/ComunityIcon.svg")),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}