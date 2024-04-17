import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:HabitUp/CommonMethods/Methods.dart';
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
        Habbits["Staying fit"]?.forEach((key1, value) {
          Habitnames.add(key1);
          Habbits["Staying fit"]![key1]!.forEach((key, value) {
            if(key=="Icon") {
              HabitIcons.add(Habbits["Staying fit"]![key1]![key]);
            }
          });
        });
        emit(StayingFitState(isStayingfitOpened: event.StayingFirOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));

      }
      if(event is StressReliefClickedEvent){
        List<String> Habitnames=[];
        List<String> HabitIcons=[];
        Habbits["Stress Relief"]?.forEach((key1, value) {
          Habitnames.add(key1);
          Habbits["Stress Relief"]![key1]!.forEach((key, value) {
            if(key=="Icon") {
              HabitIcons.add(Habbits["Stress Relief"]![key1]![key]);
            }
          });
        });
        emit(StressReliefState(isStressReliefStateOpened: event.StressReliefOpend, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
      if(event is HealthyLifeStyleClickedEvent){
        List<String> Habitnames=[];
        List<String> HabitIcons=[];
        Habbits["Healthy LifeStyle"]?.forEach((key1, value) {
          Habitnames.add(key1);
          Habbits["Healthy LifeStyle"]![key1]!.forEach((key, value) {
            if(key=="Icon") {
              HabitIcons.add(Habbits["Healthy LifeStyle"]![key1]![key]);
            }
          });
        });
        emit(HealthyLifestyleState(isHealthyLifeStyleOpened: event.HealthyLifeStyleOpend, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is LovedOnesClickedEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Habbits["Loved Ones"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Habbits["Loved Ones"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Habbits["Loved Ones"]![key1]![key]);
             }
           });
         });
        emit(LovedOnesState(isLovedOnesOpened: event.LovedOnesOpend, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is PersonalFinanceEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Habbits["Personal Finance"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Habbits["Personal Finance"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Habbits["Personal Finance"]![key1]![key]);
             }
           });
         });
        emit(PersonalFinanceState(isPersonalFinanceOpened: event.PersonalFinanceOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is OthersEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Habbits["Others"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Habbits["Others"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Habbits["Others"]![key1]![key]);
             }
           });
         });
        emit(OthersState(isOthersOpened: event.OthersOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }
       if(event is CustomEvent){
         List<String> Habitnames=[];
         List<String> HabitIcons=[];
         Habbits["Custom"]?.forEach((key1, value) {
           Habitnames.add(key1);
           Habbits["Custom"]![key1]!.forEach((key, value) {
             if(key=="Icon") {
               HabitIcons.add(Habbits["Custom"]![key1]![key]);
             }
           });
         });
        emit(CustomState(isCustomOpened: event.CustomOpened, Habitnames: Habitnames, HabitIcons: HabitIcons));
      }

    });
  }
}
