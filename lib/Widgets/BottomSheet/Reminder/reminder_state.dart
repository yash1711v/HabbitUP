part of 'reminder_bloc.dart';

@immutable
sealed class ReminderState {}

final class ReminderInitial extends ReminderState {

}

class ReminderStates extends ReminderState {
  final bool SetReminder;
  Set<String> Reminders={};
  DateTime time;
  ReminderStates({required this.SetReminder,required this.Reminders,required this.time});
}
