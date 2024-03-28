import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'habit_adision_event.dart';
part 'habit_adision_state.dart';

class HabitAdisionBloc extends Bloc<HabitAdisionEvent, HabitAdisionState> {
  HabitAdisionBloc() : super(HabitAdisionInitial()) {
    on<HabitAdisionEvent>((event, emit) {
      // TODO: implement event handler
      if(event is SelectedColorEvent){
        emit(SelectedColorState(index: event.SelectedIndex,name: event.name,icon: event.icon,target: event.target, Subtasks: event.Subtasks,));
      }
    });
  }
}
