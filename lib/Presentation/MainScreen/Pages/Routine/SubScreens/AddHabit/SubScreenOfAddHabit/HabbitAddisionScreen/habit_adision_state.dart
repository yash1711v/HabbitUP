part of 'habit_adision_bloc.dart';

@immutable
abstract class HabitAdisionState {}

class HabitAdisionInitial extends HabitAdisionState {}

class SelectedColorState extends HabitAdisionState{
  int index;

  SelectedColorState({required this.index});
}
