part of 'habit_adision_bloc.dart';

@immutable
abstract class HabitAdisionState {}

class HabitAdisionInitial extends HabitAdisionState {}

class SelectedColorState extends HabitAdisionState{
  int index;
String name;
String icon;
  String target;
  SelectedColorState({required this.index,this.name="",this.icon="",this.target=""});
}
