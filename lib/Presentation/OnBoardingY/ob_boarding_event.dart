part of 'ob_boarding_bloc.dart';

@immutable
abstract class ObBoardingEvent {}

class OnboardingButtonShowEvent extends ObBoardingEvent{
  OnboardingButtonShowEvent();
}
class OnStartButtonClickEvebt extends ObBoardingEvent{
  bool done=false;
  BuildContext context;
  OnStartButtonClickEvebt({required this.done,required this.context});


}
