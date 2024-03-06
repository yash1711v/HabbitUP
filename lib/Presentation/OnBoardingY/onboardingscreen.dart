import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'ob_boarding_bloc.dart';

class OnBoard extends StatefulWidget {
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
      vsync: this,
          duration: Duration(seconds: 9)
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        BlocProvider.of<ObBoardingBloc>(context).add(OnboardingButtonShowEvent());
        print("Animation completed");
      }
    });

  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context2) {
    return BlocBuilder<ObBoardingBloc, ObBoardingState>(
      builder: (context, state) {
        bool showbutton = false;
        if (state is ObBoardingShowButtonState) {
          showbutton = state.startanimation;
        }
        return Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Lottie.asset("assets/Animations/OnboardingAnimation.json",
                controller: _animationController,
                fit: BoxFit.fill, repeat: false,

            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: SizedBox(
                width: 327,
                height: 80,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: showbutton == true ? 1 : 0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Color(0xFF1F1F1F),
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
                        BlocProvider.of<ObBoardingBloc>(context).add(OnStartButtonClickEvebt(done: true, context: context2));
                      },
                      child: Text(
                         'Get Started',
                        style: GoogleFonts.dmSans(textStyle:const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ),
          )
        ]);
      },
    );
  }
}
