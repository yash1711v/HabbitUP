import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  RoutineBloc() : super(RoutineInitial()) {
    on<RoutineEvent>((event, emit) {
       if(event is ListchangeEvent){
         try {
           emit(ListchangeState(fancyCards: event.fancyCards,state: event.state));
         }catch(e){
           print(e);
         }
       }
    });
  }
}
