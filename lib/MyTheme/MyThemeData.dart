import 'package:flutter/material.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
scaffoldBackgroundColor:  Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
        circularTrackColor: Colors.white

    ),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black,fontFamily: 'Varta'),
      headline2: TextStyle(color: Colors.black,fontFamily: 'Varta'),
      bodyText1: TextStyle(color: Colors.white,fontFamily: 'Varta'),
      bodyText2: TextStyle(color: Colors.black,fontFamily: 'Varta'),
      button: TextStyle(color: Colors.black,fontFamily: 'Varta'),
      subtitle1: TextStyle(color: Colors.black,fontFamily: 'Varta'),
      subtitle2: TextStyle(color: Color(0xFFF0F0EA),fontFamily: 'Varta'),
    ),

    dialogBackgroundColor: Colors.black,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white
    ),
    buttonTheme: const ButtonThemeData(
      minWidth: 327,
      height: 61,
      buttonColor: Color(0xFFFEF656),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
    ),
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor:Color(0xFFFEF656),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(

      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(width: 1, color: Colors.transparent),
        //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      filled: true,
      fillColor: Color(0xFFF0EFEA),
        prefixIconColor: Color(0x7F1F1F1F),
      enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(width: 1, color: Colors.transparent),
        //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintStyle: TextStyle(color: Color(0x7F1F1F1F))
    ),


  );

  static final ThemeData darkTheme = ThemeData(
    // Define dark theme data here
    // For simplicity, I'll just use the same theme as the light theme
    primaryColor: Color(0xFF1F1F1F),
    scaffoldBackgroundColor: Color(0xFF1F1F1F),
    dialogBackgroundColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black,
            circularTrackColor: Colors.black
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white,fontFamily: 'Varta'),
      bodyText1: TextStyle(color: Colors.black,fontFamily: 'Varta'),
      bodyText2: TextStyle(color: Colors.white,fontFamily: 'Varta'),
      button: TextStyle(color: Colors.white,fontFamily: 'Varta'),
      subtitle1: TextStyle(color: Colors.white,fontFamily: 'Varta'),
      subtitle2: TextStyle(color: Color(0xFF292929),fontFamily: 'Varta'),

    ),
    buttonTheme: ButtonThemeData(
      minWidth: 327,
      height: 61,
      buttonColor: Color(0xFFFEF656),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
    ),
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor:Color(0xFFFEF656),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black
    ),
    inputDecorationTheme: InputDecorationTheme(

      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(width: 1, color: Colors.transparent),
        //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      filled: true,
      fillColor: Color(0xFF292929),
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
      prefixIconColor: Colors.white.withOpacity(0.5),
      enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(width: 1, color: Colors.transparent),
        //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
