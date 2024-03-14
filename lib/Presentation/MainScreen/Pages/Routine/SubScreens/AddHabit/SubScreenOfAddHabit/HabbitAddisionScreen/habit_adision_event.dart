part of 'habit_adision_bloc.dart';

@immutable
abstract class HabitAdisionEvent {}

class SelectedColorEvent extends HabitAdisionEvent{
  int SelectedIndex;

  SelectedColorEvent({required this.SelectedIndex});
}
