

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../LocalStorage/SharedPref/Sharedpref.dart';

part 'ob_boarding_event.dart';
part 'ob_boarding_state.dart';

class ObBoardingBloc extends Bloc<ObBoardingEvent, ObBoardingState> {
  ObBoardingBloc() : super(ObBoardingInitial()) {

    on<OnboardingButtonShowEvent>((event, emit) {

     bool showButton=true;

      emit(ObBoardingShowButtonState(showButton));
    });
    on<OnStartButtonClickEvebt>((event, emit) {
       Sharedpref().setOnBoarding(event.done);
       Navigator.of(event.context).pushReplacementNamed("/SignupScreen");

    });
  }
}
