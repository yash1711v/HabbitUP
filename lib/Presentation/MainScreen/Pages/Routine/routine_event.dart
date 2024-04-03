part of 'routine_bloc.dart';

@immutable
abstract class RoutineEvent {}

class ListchangeEvent extends RoutineEvent {
  late List<Widget> fancyCards;
  String state;
  Map<String,dynamic> habits;
  ListchangeEvent({required this.fancyCards,this.state="All",required this.habits});
}
