import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitup/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:habitup/MyTheme/theme_event.dart';
import 'package:meta/meta.dart';

import 'ThememSelectionWidget.dart';


part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc() : super(SystemDefaultThemeState()) {
    final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).platformBrightness;

    // Initialize with the system default theme
    on<updateEvent>((event, emit) {
      if(event.theme=="DarkMode"){
        print("DarkTheme");
        Sharedpref().setThemeData("DarkTheme");
        emit(DarkThemeState());
      }else if (event.theme=="LightTheme"){
        print("LightTheme");
        Sharedpref().setThemeData("LightTheme");
        emit(LightThemeState());
      }else {
        print("SystemDefault");
        if (brightness == Brightness.dark) {
          Sharedpref().setThemeData("DarkTheme");
          emit(SystemDefaultThemeState());
        } else {
          Sharedpref().setThemeData("LightTheme");
          emit(SystemDefaultThemeState()); // Start with the light theme by default
        }
      }
    });

    on<ThemeSelectionEvent>((event, emit) {
      showModalBottomSheet(
        context: event.context,
        builder: (BuildContext context) => ThemeSelectorBottomSheet(),
      );
    });
  }


  }


