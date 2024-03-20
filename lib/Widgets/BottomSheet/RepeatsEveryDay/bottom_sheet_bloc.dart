import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(BottomSheetInitial()) {
    on<BottomSheetEvent>((event, emit) {
      // TODO: implement event handler
      if(event is MothChangeEvent){
        emit(MonthChangeState(monthIndex: event.monthIndex, Datesare: event.Datesare));
      }
      if(event is RepeatCycleEvent){
        emit(RepeatCycleState(repeat: event.repeat,whichOption: event.whichOption,Frequency: event.Frequency,numberPickervalue: event.numberPickervalue,setEndDate: event.setEndDate,monthIndex: event.monthIndex, onWhichDayif: event.onWhichDaysIfweeklu));
      }
    });
  }
}
