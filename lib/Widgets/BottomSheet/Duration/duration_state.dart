part of 'duration_bloc.dart';

@immutable
sealed class DurationState {}

final class DurationInitial extends DurationState {}

final class SetTimeState extends DurationState{
  bool settingTime=false;
  bool settingEndTime=false;
  SetTimeState({required this.settingTime,this.settingEndTime=false});
}
