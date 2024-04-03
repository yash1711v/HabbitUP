part of 'routine_bloc.dart';

@immutable
abstract class RoutineState {}

class RoutineInitial extends RoutineState {}

class ListchangeState extends RoutineState {
  late List<Widget> fancyCards;
  String state;
  Map<String,dynamic> habits;
  ListchangeState({required this.fancyCards,this.state="All",required this.habits});
}
