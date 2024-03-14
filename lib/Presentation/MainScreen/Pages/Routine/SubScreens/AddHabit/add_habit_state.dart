part of 'add_habit_bloc.dart';

@immutable
abstract class AddHabitState {}

class AddHabitInitial extends AddHabitState {}

class SearchBartapState extends AddHabitState{
  final bool isTaped;

  SearchBartapState({required this.isTaped});
}

class StayingFitState extends AddHabitState{
  final bool isStayingfitOpened;
  StayingFitState({required this.isStayingfitOpened});
}

class StressReliefState extends AddHabitState{
  final bool isStressReliefStateOpened;
  StressReliefState({required this.isStressReliefStateOpened});
}

class HealthyLifestyleState extends AddHabitState{
  final bool isHealthyLifeStyleOpened;

  HealthyLifestyleState({required this.isHealthyLifeStyleOpened});
}

class LovedOnesState extends AddHabitState{
  final bool isLovedOnesOpened;

  LovedOnesState({required this.isLovedOnesOpened});
}

class PersonalFinanceState extends AddHabitState{
  final bool isPersonalFinanceOpened;
  PersonalFinanceState({required this.isPersonalFinanceOpened});
}

class OthersState extends AddHabitState{
  final bool isOthersOpened;
  OthersState({required this.isOthersOpened});
}