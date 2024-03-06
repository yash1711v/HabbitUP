part of 'general_bloc.dart';

@immutable
abstract class GeneralState {}

class GeneralInitial extends GeneralState {}

class GeneralisOnBoardingDoneState extends GeneralState{}


class GeneralisAuthenticatedState extends GeneralState{}

class Generalis_UnAuthenticated_NotGuesState extends GeneralState{}

class GeneralisGuestState extends GeneralState{}
