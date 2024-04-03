part of 'progress_bloc.dart';

@immutable
abstract class ProgressEvent {}

class Progresschangeevent extends ProgressEvent{
  Map<String,dynamic> habits;

  Progresschangeevent(this.habits);
}
