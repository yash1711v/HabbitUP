import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<MainScreenEvent>((event, emit) {
     if(event is PageChangeEvent){
       emit(MainScreenPageChangeState(page: event.Page));
     }
    });
  }
}
