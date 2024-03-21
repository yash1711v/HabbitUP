part of 'habit_adision_bloc.dart';

@immutable
abstract class HabitAdisionEvent {}

class SelectedColorEvent extends HabitAdisionEvent{
  int SelectedIndex;
  List<String> properties;
  SelectedColorEvent({required this.SelectedIndex,required this.properties});
}
