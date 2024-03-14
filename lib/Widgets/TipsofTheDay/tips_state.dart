part of 'tips_bloc.dart';

@immutable
abstract class TipsState {}

class TipsInitial extends TipsState {}

class RandomTipState extends TipsState {
  final RandomStringMap;
  RandomTipState({required this.RandomStringMap});
}
