import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:meta/meta.dart';

part 'avator_event.dart';
part 'avator_state.dart';

class AvatorBloc extends Bloc<AvatorEvent, AvatorState> {

  AvatorBloc() : super(AvatorInitial()) {
    on<AvatarFetchName>((event, emit) async {
       String name= await Sharedpref().getUsername();

       emit(AvatorFetchedState(name: name, animation: true));

    });
  }
}
