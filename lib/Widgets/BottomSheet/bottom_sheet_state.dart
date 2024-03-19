part of 'bottom_sheet_bloc.dart';

@immutable
sealed class BottomSheetState {}

final class BottomSheetInitial extends BottomSheetState {}

final class MonthChangeState extends BottomSheetState {
  int monthIndex;

  MonthChangeState({required this.monthIndex});

}
final class RepeatCycleState extends BottomSheetState{
 bool repeat;
 String whichOption="";
 bool Frequency=false;
 int numberPickervalue=0;
 bool setEndDate=false;
 int monthIndex=0;

 RepeatCycleState({required this.repeat, this.whichOption = '',this.Frequency=false,this.numberPickervalue=0,this.setEndDate=false,this.monthIndex=0});
}
