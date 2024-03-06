part of 'avator_bloc.dart';

@immutable
abstract class AvatorState {}

class AvatorInitial extends AvatorState {

}

class AvatorFetchedState extends AvatorState {
  String name;
 bool animation;
  AvatorFetchedState({required this.name,required  this.animation});
}
