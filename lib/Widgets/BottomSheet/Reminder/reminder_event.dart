part of 'reminder_bloc.dart';

@immutable
sealed class ReminderEvent {}

class ReminderEvents extends ReminderEvent {
  final bool SetReminder;
  Set<String> Reminders={};
  DateTime time;
  ReminderEvents({required this.SetReminder,required this.Reminders,required this.time});
}