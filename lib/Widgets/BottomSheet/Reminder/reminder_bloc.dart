import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderInitial()) {
    on<ReminderEvent>((event, emit) {
       if(event  is ReminderEvents){
          emit(ReminderStates(SetReminder: event.SetReminder, Reminders: event.Reminders,time: event.time));
       }
    });
  }
}
