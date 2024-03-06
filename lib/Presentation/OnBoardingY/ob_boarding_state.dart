part of 'ob_boarding_bloc.dart';

@immutable
abstract class ObBoardingState {}


class ObBoardingInitial extends ObBoardingState {

}

class ObBoardingShowButtonState extends ObBoardingState {
  bool startanimation;
  ObBoardingShowButtonState(this.startanimation,);
}

