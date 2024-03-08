part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class PageChangeEvent extends MainScreenEvent{
  int Page=0;

  PageChangeEvent({required this.Page});
}
