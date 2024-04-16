part of 'custom_habit_bloc.dart';

@immutable
sealed class CustomHabitEvent {}

class SelectedColorEventCustom extends CustomHabitEvent{

  List<String> properties;
  SelectedColorEventCustom({required this.properties});
}

