import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HabitUp/Presentation/FeelingsSelection/feelings_selection_bloc.dart';

class FeelingSelection extends StatelessWidget {
  const FeelingSelection({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FeelingsSelectionBloc>(context).add(FeelingsEvent("Happy"));
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: BlocBuilder<FeelingsSelectionBloc, FeelingsSelectionState>(
              builder: (context, state) {
                bool startAnimation = false;
                if (state is feelingState) {
                  startAnimation = state.animation;
                }
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500),
                  transform: Matrix4.translationValues(
                      startAnimation ? 0 : -MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Center(
                    child: Text(
                      "How are you",
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'DM Serif Display',
                          fontWeight: FontWeight.w400,
                          height: 0.02,
                          letterSpacing: 0.40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: BlocBuilder<FeelingsSelectionBloc, FeelingsSelectionState>(
              builder: (context, state) {
                bool startAnimation = false;
                if (state is feelingState) {
                  startAnimation = state.animation;
                }
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500),
                  transform: Matrix4.translationValues(
                      startAnimation ? 0 : -MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "feeling",
                        style: GoogleFonts.dmSerifDisplay(
                          textStyle: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 40,
                            fontFamily: 'DM Serif Display',
                            fontWeight: FontWeight.w400,
                            height: 0.02,
                            letterSpacing: 0.40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "today?",
                        style: GoogleFonts.dmSerifDisplay(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'DM Serif Display',
                            fontWeight: FontWeight.w400,
                            height: 0.02,
                            letterSpacing: 0.40,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 75),
            child: Center(
              child: Container(
                width: 109,
                height: 109,
                child:
                    BlocBuilder<FeelingsSelectionBloc, FeelingsSelectionState>(
                  builder: (context, state) {
                    String value = "Happy";
                    bool animation = false;
                    if (state is feelingState) {
                      value = state.value;
                      animation = state.animation;
                    }
                    return AnimatedOpacity(
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 1300),
                      opacity: animation ? 1 : 0,
                      child:
                          SvgPicture.asset("assets/ImagesY/Mood/${value}.svg"),
                    );
                  },
                ),
              ),
            ),
          ),
          BlocBuilder<FeelingsSelectionBloc, FeelingsSelectionState>(
            builder: (context, state) {
              List<String> options = [
                'Happy',
                'Confident',
                'Loved',
                'Excited',
                'Relaxed',
                'Sad',
                'Angry',
                'Annoyed',
                'Sick',
                'Confused',
                'Dead',
              ];
              String value = "Happy";
              bool startAnimation = false;
              if (state is feelingState) {
                startAnimation = state.animation;
                value = state.value;
              }
              return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                    startAnimation ? 0 : MediaQuery.of(context).size.width,
                    0,
                    0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<FeelingsSelectionBloc>(context)
                                .add(FeelingsEvent(options[0]));
                          },
                          child: Container(
                            width: 90,
                            height: 31,
                            decoration: ShapeDecoration(
                              color: value == options[0]
                                  ? Color(0xFFFEF656)
                                  : Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                options[0],
                                style: GoogleFonts.dmSans(
                                  textStyle:TextStyle(
                                    color: value == options[0]?Color(0xFF1F1F1F):Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.color,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<FeelingsSelectionBloc>(context)
                                  .add(FeelingsEvent(options[1]));
                            },
                            child: Container(
                              width: 90,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: value == options[1]
                                    ? Color(0xFFFEF656)
                                    : Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  options[1],
                                  style: GoogleFonts.dmSans(
                                    textStyle:TextStyle(
                                      color:  value == options[1]?Color(0xFF1F1F1F):Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<FeelingsSelectionBloc>(context)
                                .add(FeelingsEvent(options[2]));
                          },
                          child: Container(
                            width: 90,
                            height: 31,
                            decoration: ShapeDecoration(
                              color: value == options[2]
                                  ? Color(0xFFFEF656)
                                  : Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                options[2],
                                style: GoogleFonts.dmSans(
                                  textStyle:TextStyle(
                                    color:  value == options[2]?Color(0xFF1F1F1F):Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.color,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<FeelingsSelectionBloc>(context)
                                  .add(FeelingsEvent(options[3]));
                            },
                            child: Container(
                              width: 90,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: value == options[3]
                                    ? Color(0xFFFEF656)
                                    : Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  options[3],
                                  style: GoogleFonts.dmSans(
                                    textStyle:TextStyle(
                                      color:  value == options[3]?Color(0xFF1F1F1F):Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<FeelingsSelectionBloc>(context)
                                  .add(FeelingsEvent(options[4]));
                            },
                            child: Container(
                              width: 90,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: value == options[4]
                                    ? Color(0xFFFEF656)
                                    : Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  options[4],
                                  style: GoogleFonts.dmSans(
                                    textStyle:TextStyle(
                                      color: value == options[4]?Color(0xFF1F1F1F):Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<FeelingsSelectionBloc>(context)
                                  .add(FeelingsEvent(options[5]));
                            },
                            child: Container(
                              width: 90,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: value == options[5]
                                    ? Color(0xFFFEF656)
                                    : Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  options[5],
                                  style: GoogleFonts.dmSans(
                                    textStyle:TextStyle(
                                      color:  value == options[5]?Color(0xFF1F1F1F):Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<FeelingsSelectionBloc>(context)
                                    .add(FeelingsEvent(options[6]));
                              },
                              child: Container(
                                width: 90,
                                height: 31,
                                decoration: ShapeDecoration(
                                  color: value == options[6]
                                      ? Color(0xFFFEF656)
                                      : Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(31),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    options[6],
                                    style: GoogleFonts.dmSans(
                                      textStyle:TextStyle(
                                        color:  value == options[6]?Color(0xFF1F1F1F):Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.color,
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<FeelingsSelectionBloc>(context)
                                  .add(FeelingsEvent(options[7]));
                            },
                            child: Container(
                              width: 90,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: value == options[7]
                                    ? Color(0xFFFEF656)
                                    : Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  options[7],
                                  style: GoogleFonts.dmSans(
                                    textStyle:TextStyle(
                                      color:  value == options[7]?Color(0xFF1F1F1F):Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<FeelingsSelectionBloc>(context)
                                .add(FeelingsEvent(options[8]));
                          },
                          child: Container(
                            width: 90,
                            height: 31,
                            decoration: ShapeDecoration(
                              color: value == options[8]
                                  ? Color(0xFFFEF656)
                                  : Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                options[8],
                                style: GoogleFonts.dmSans(
                                  textStyle:TextStyle(
                                    color: value == options[8]?Color(0xFF1F1F1F):Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.color,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<FeelingsSelectionBloc>(context)
                                  .add(FeelingsEvent(options[9]));
                            },
                            child: Container(
                              width: 90,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: value == options[9]
                                    ? Color(0xFFFEF656)
                                    : Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  options[9],
                                  style: GoogleFonts.dmSans(
                                    textStyle:TextStyle(
                                      color:  value == options[9]?Color(0xFF1F1F1F):Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.color,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<FeelingsSelectionBloc>(context)
                                .add(FeelingsEvent(options[10]));
                          },
                          child: Container(
                            width: 90,
                            height: 31,
                            decoration: ShapeDecoration(
                              color: value == options[10]
                                  ? Color(0xFFFEF656)
                                  : Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                options[10],
                                style: GoogleFonts.dmSans(
                                  textStyle:TextStyle(
                                    color:  value == options[10]?Color(0xFF1F1F1F):Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.color,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<FeelingsSelectionBloc, FeelingsSelectionState>(
            builder: (context, state) {
              bool animation=false;
              String mood="";
              if(state is feelingState){
                animation=state.animation;
                mood=state.value;
              }
              return Padding(
                padding: EdgeInsets.only(top: 100),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 700),
                  transform: Matrix4.translationValues(
                      0, animation ? 0 : MediaQuery.of(context).size.width, 0),
                  width: 327,
                  height: 61,
                  child: ElevatedButton(
                      onPressed: () {
                    BlocProvider.of<FeelingsSelectionBloc>(context).add(FeelingsSetEvent(mood, context: context));

                      },
                      child: Text(
                        "Here’s how I feel.",
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      )),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
