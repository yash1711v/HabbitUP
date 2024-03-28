part of 'habit_adision_bloc.dart';

@immutable
abstract class HabitAdisionEvent {}

class SelectedColorEvent extends HabitAdisionEvent{
  int SelectedIndex;
  List<String> properties;
  String name;
  String icon;
  String target;
  Set<String> Subtasks={};
  SelectedColorEvent({required this.SelectedIndex,required this.properties,this.name="",this.icon="",this.target="",required this.Subtasks});
}
