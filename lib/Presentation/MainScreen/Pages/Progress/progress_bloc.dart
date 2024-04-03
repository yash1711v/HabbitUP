import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressInitial()) {
    on<ProgressEvent>((event, emit) {
      // TODO: implement event handler
      if(event is Progresschangeevent){
        emit(Progressstate(habits: event.habits));
      }
    });
  }
}
