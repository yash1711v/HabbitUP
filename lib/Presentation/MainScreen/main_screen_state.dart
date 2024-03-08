part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class MainScreenPageChangeState extends MainScreenState{
  int page;

  MainScreenPageChangeState({required this.page});
}
