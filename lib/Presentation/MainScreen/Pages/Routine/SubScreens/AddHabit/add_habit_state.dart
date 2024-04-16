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
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  StayingFitState({required this.isStayingfitOpened,required this.Habitnames,required this.HabitIcons});
}

class StressReliefState extends AddHabitState{
  final bool isStressReliefStateOpened;
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  StressReliefState({required this.isStressReliefStateOpened,required this.Habitnames,required this.HabitIcons});
}

class HealthyLifestyleState extends AddHabitState{
  final bool isHealthyLifeStyleOpened;
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  HealthyLifestyleState({required this.isHealthyLifeStyleOpened,required this.Habitnames,required this.HabitIcons});
}

class LovedOnesState extends AddHabitState{
  final bool isLovedOnesOpened;
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  LovedOnesState({required this.isLovedOnesOpened,required this.Habitnames,required this.HabitIcons});
}

class PersonalFinanceState extends AddHabitState{
  final bool isPersonalFinanceOpened;
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  PersonalFinanceState({required this.isPersonalFinanceOpened,required this.Habitnames,required this.HabitIcons});
}

class OthersState extends AddHabitState{
  final bool isOthersOpened;
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  OthersState({required this.isOthersOpened,required this.Habitnames,required this.HabitIcons});
}
class CustomState extends AddHabitState{
  final bool isCustomOpened;
  List<String> Habitnames=[];
  List<String> HabitIcons=[];
  CustomState({required this.isCustomOpened,required this.Habitnames,required this.HabitIcons});
}