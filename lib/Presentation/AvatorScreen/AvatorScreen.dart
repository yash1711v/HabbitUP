import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:fluttermoji/fluttermojiThemeData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:HabitUp/Presentation/AvatorScreen/avator_bloc.dart';

import '../../Widgets/edit_avator.dart';

class AvatorScreen extends StatefulWidget {
  const AvatorScreen({super.key});

  @override
  State<AvatorScreen> createState() => _AvatorScreenState();
}

class _AvatorScreenState extends State<AvatorScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AvatorBloc>(context).add(AvatarFetchName());
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/ImagesY/AvatorBg.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           StreamBuilder(stream: BlocProvider.of<AvatorBloc>(context).stream,builder: (context,snapshot){
             if(snapshot.hasData){
               String name = "Yash";
               if (snapshot.data is AvatorFetchedState) {
                 name = (snapshot.data as AvatorFetchedState).name;
               }
               print(name);
               return  Padding(
                 padding: const EdgeInsets.only(top: 50, left: 15),
                 child: AnimatedTextKit(
                   animatedTexts: [
                     TyperAnimatedText('Choose your\navatar, ${name.split(" ").first}',
                         textStyle: GoogleFonts.dmSerifDisplay(
                           textStyle: const TextStyle(
                             color: Colors.white,
                             fontSize: 40,
                             fontWeight: FontWeight.w400,
                             height: 0,
                           ),
                         ),
                         speed: Duration(milliseconds: 100)),
                   ],
                   totalRepeatCount: 1,
                   pause: const Duration(milliseconds: 10),
                   displayFullTextOnTap: true,
                   stopPauseOnTap: true,
                 ),
               );
             }
             else {return SizedBox();}

           }),
            BlocBuilder<AvatorBloc, AvatorState>(
              builder: (context, state) {
                bool startAnimation = false;
                if (state is AvatorFetchedState) {
                  startAnimation = state.animation;
                }
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 800),
                  transform: Matrix4.translationValues(
                      startAnimation
                          ? 0
                          : -MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: FluttermojiCircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<AvatorBloc, AvatorState>(
              builder: (context, state) {
                bool startAnimation = false;
                if (state is AvatorFetchedState) {
                  startAnimation = state.animation;
                }
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 1000),
                  transform: Matrix4.translationValues(
                      startAnimation
                          ? 0
                          : MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                             // Change background color// Change text color// Change padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Change border radius
                              ),
                              elevation: 5, // Change elevation
                            ),
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              EditAvator(context);
                            },
                            child: const Text(
                              "Customize Avator",
                              style: TextStyle(color: Colors.black),
                            ))),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Center(
                child: SizedBox(
                  width: 327,
                  height: 61,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color(0xFFFEF656),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                     Sharedpref().setDetails(true);
                     Navigator.of(context).pushReplacementNamed("/FeelingsSelection");
                    },
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
