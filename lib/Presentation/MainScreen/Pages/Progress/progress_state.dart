part of 'progress_bloc.dart';

@immutable
abstract class ProgressState {}

class ProgressInitial extends ProgressState {}

class Progressstate extends ProgressState{
  Map<String,dynamic> habits;

  Progressstate({required this.habits});
}
