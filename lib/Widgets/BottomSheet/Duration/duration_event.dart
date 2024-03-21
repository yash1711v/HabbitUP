part of 'duration_bloc.dart';

@immutable
sealed class DurationEvent {}

class SetTimeEvent extends DurationEvent {
  bool settingTime=false;
  bool settingEndTime=false;

  SetTimeEvent({required this.settingTime,this.settingEndTime=false});
}
