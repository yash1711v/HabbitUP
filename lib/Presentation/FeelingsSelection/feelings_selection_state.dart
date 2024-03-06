part of 'feelings_selection_bloc.dart';

@immutable
abstract class FeelingsSelectionState {}

class FeelingsSelectionInitial extends FeelingsSelectionState {}

class feelingState extends FeelingsSelectionState {
  bool animation=true;
  String value="Happy";

  feelingState({required this.value});
}

class feelingsOnPressedState extends FeelingsSelectionState{}
