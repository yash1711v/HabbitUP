part of 'custom_habit_bloc.dart';

@immutable
sealed class CustomHabitState {}

final class CustomHabitInitial extends CustomHabitState {}

class SelectedColorState extends CustomHabitState{
  List<String> properties;
  SelectedColorState({required this.properties});
}
