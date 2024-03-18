import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:habitup/CommonMethods/Methods.dart';
import 'package:meta/meta.dart';

part 'add_habit_event.dart';
part 'add_habit_state.dart';

class AddHabitBloc extends Bloc<AddHabitEvent, AddHabitState> {
  AddHabitBloc() : super(AddHabitInitial()) {
    on<AddHabitEvent>((event, emit) async {
      if(event is SearchBarTappedEvent){
        emit(SearchBartapState(isTaped: event.isTapped));
      }
      if(event is StayingFitClickedEvent){
        List<String> Habitnames=[];
        List<String> HabitIcons=[];
        Methods().Habbits["Staying fit"]?.forEach((key1, value) {
          Habitnames.add(key1);
          Methods().Habbits["Staying fit"]![key1]!.forEach((key, value) {
            if(key=="Icon") {
              HabitIcons.add(Methods().Habbits["Staying fit"]![key1]![key]);
            }
          });
        });
        emit(StayingFitState(isStayingfitOpened: event.StayingFirOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));

      }
      if(event is StressReliefClickedEvent){
        List<String> Habitnames=[];
        List<String> HabitIcons=[];
        Methods().Habbits["Stress Relief"]?.forEach((key1, value) {
          Habitnames.add(key1);
          Methods().Habbits["Stress Relief"]![key1]!.forEach((key, value) {
            if(key=="Icon") {
              HabitIcons.add(Methods().Habbits["Stress Relief"]![key1]![key]);
            }
          });
        });
        emit(StressReliefState(isStressReliefStateOpened: event.StressReliefOpend, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
      if(event is HealthyLifeStyleClickedEvent){
        List<String> Habitnames=[];
        List<String> HabitIcons=[];
        Methods().Habbits["Healthy LifeStyle"]?.forEach((key1, value) {
          Habitnames.add(key1);
          Methods().Habbits["Healthy LifeStyle"]![key1]!.forEach((key, value) {
            if(key=="Icon") {
              HabitIcons.add(Methods().Habbits["Healthy LifeStyle"]![key1]![key]);
            }
          });
        });
        emit(HealthyLifestyleState(isHealthyLifeStyleOpened: event.HealthyLifeStyleOpend, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is LovedOnesClickedEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Methods().Habbits["Loved Ones"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Methods().Habbits["Loved Ones"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Methods().Habbits["Loved Ones"]![key1]![key]);
             }
           });
         });
        emit(LovedOnesState(isLovedOnesOpened: event.LovedOnesOpend, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is PersonalFinanceEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Methods().Habbits["Personal Finance"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Methods().Habbits["Personal Finance"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Methods().Habbits["Personal Finance"]![key1]![key]);
             }
           });
         });
        emit(PersonalFinanceState(isPersonalFinanceOpened: event.PersonalFinanceOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is OthersEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Methods().Habbits["Others"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Methods().Habbits["Others"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Methods().Habbits["Others"]![key1]![key]);
             }
           });
         });
        emit(OthersState(isOthersOpened: event.OthersOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }

    });
  }
}
