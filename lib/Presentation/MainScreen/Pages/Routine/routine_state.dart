part of 'routine_bloc.dart';

@immutable
abstract class RoutineState {}

class RoutineInitial extends RoutineState {}

class ListchangeState extends RoutineState {
  late List<Widget> fancyCards;
  String state;
  ListchangeState({required this.fancyCards,this.state="All"});
}
