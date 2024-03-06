import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../FirebaseFunctionality/DatabaseFeatures.dart';
import '../../LocalStorage/SharedPref/Sharedpref.dart';

part 'feelings_selection_event.dart';
part 'feelings_selection_state.dart';

class FeelingsSelectionBloc
    extends Bloc<FeelingsSelectionEvent, FeelingsSelectionState> {
  FeelingsSelectionBloc() : super(FeelingsSelectionInitial()) {
    on<FeelingsSelectionEvent>((event, emit) async {
      String Uid = await Sharedpref().getUid();
      // TODO: implement event handler
      if (event is FeelingsEvent) {
        emit(feelingState(value: event.value));
      }
      if (event is FeelingsSetEvent) {
        Sharedpref().setFeelingsScreenDate(DateTime.now().day);
          Navigator.of(event.context).pushReplacementNamed("/MainScreen");

        emit(feelingsOnPressedState());
        await  Sharedpref().storeMood(event.value).then((value) async {
          var mood = await Sharedpref().getMoodMap();
          await DatabaseFeatures()
              .updateFeelings(feelings: json.encode(mood), Uid: Uid)
              .then((value) {
            print("Feelings Updated");


          });
        });
      }
    });
  }
}
