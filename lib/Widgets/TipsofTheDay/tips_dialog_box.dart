import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitup/Widgets/TipsofTheDay/tips_bloc.dart';

class Tips extends StatelessWidget {
  Tips({super.key});



  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TipsBloc>(context).add(TipsEventHitted());
    return BlocBuilder<TipsBloc, TipsState>(
      builder: (context, state) {
        var _getRandomTip={};
        if(state is RandomTipState){
          _getRandomTip=state.RandomStringMap;
        }
        print(_getRandomTip);
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 2,
          child: Container(
            width: 277,
           height: 300,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color:Theme.of(context).textTheme.bodyText2?.color==Colors.black?Colors.white:Color(0xFF1F1F1F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 63,
                  decoration: const BoxDecoration(color: Color(0xFFA8E32C)),
                  child: Center(child: Text("Tip of the Day",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'DM Serif Display',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: 244,
                    height: 24,
                    child: Text(
                      _getRandomTip['heading'].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFA8E32C),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: SizedBox(
                    width: 220,
                    height: 66,
                    child:_getRandomTip['content']
                    ,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 85),
                  child: Text(
                    'Source- Atomic Habits',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }


}

