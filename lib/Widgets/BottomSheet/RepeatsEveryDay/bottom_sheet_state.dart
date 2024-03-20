part of 'bottom_sheet_bloc.dart';

@immutable
sealed class BottomSheetState {}

final class BottomSheetInitial extends BottomSheetState {}

final class MonthChangeState extends BottomSheetState {
  int monthIndex;
  Map<String,Set<int>> Datesare={};
  MonthChangeState({required this.monthIndex,required this.Datesare});

}

final class RepeatCycleState extends BottomSheetState{
 bool repeat;
 String whichOption="";
 bool Frequency=false;
 int numberPickervalue=0;
 bool setEndDate=false;
 int monthIndex=0;
 Set<int> onWhichDayif={};

 RepeatCycleState({required this.repeat, this.whichOption = '',this.Frequency=false,this.numberPickervalue=0,this.setEndDate=false,this.monthIndex=0,required this.onWhichDayif});
}
