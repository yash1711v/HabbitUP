part of 'feelings_selection_bloc.dart';

@immutable
abstract class FeelingsSelectionEvent {}

class FeelingsEvent extends FeelingsSelectionEvent {
  String value;

  FeelingsEvent(this.value);
}

class FeelingsSetEvent extends FeelingsSelectionEvent{
  String value="Happy";
  BuildContext context;
  FeelingsSetEvent(this.value,{required this.context});
}