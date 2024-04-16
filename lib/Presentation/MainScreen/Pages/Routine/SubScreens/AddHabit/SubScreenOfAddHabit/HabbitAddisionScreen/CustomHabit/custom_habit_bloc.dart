import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_habit_event.dart';
part 'custom_habit_state.dart';

class CustomHabitBloc extends Bloc<CustomHabitEvent, CustomHabitState> {
  CustomHabitBloc() : super(CustomHabitInitial()) {
    on<CustomHabitEvent>((event, emit) {
      // TODO: implement event handler
      if(event is SelectedColorEventCustom){
        emit(SelectedColorState(properties: event.properties));
      }
    });
  }
}
