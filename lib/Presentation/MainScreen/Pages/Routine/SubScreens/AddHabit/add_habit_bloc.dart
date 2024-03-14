import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_habit_event.dart';
part 'add_habit_state.dart';

class AddHabitBloc extends Bloc<AddHabitEvent, AddHabitState> {
  AddHabitBloc() : super(AddHabitInitial()) {
    on<AddHabitEvent>((event, emit) {
      if(event is SearchBarTappedEvent){
        emit(SearchBartapState(isTaped: event.isTapped));
      }
      if(event is StayingFitClickedEvent){
        emit(StayingFitState(isStayingfitOpened: event.StayingFirOpened));
      }
      if(event is StressReliefClickedEvent){
        emit(StressReliefState(isStressReliefStateOpened: event.StressReliefOpend));
      }
      if(event is HealthyLifeStyleClickedEvent){
        emit(HealthyLifestyleState(isHealthyLifeStyleOpened: event.HealthyLifeStyleOpend));
      }
       if(event is LovedOnesClickedEvent){
        emit(LovedOnesState(isLovedOnesOpened: event.LovedOnesOpend));
      }
       if(event is PersonalFinanceEvent){
        emit(PersonalFinanceState(isPersonalFinanceOpened: event.PersonalFinanceOpened));
      }
       if(event is OthersEvent){
        emit(OthersState(isOthersOpened: event.OthersOpened));
      }

    });
  }
}
