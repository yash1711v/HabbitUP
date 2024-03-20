part of 'bottom_sheet_bloc.dart';

@immutable
sealed class BottomSheetEvent {}

class MothChangeEvent extends BottomSheetEvent{
  int monthIndex;
  Map<String,Set<int>> Datesare={};
  MothChangeEvent({required this.monthIndex,required this.Datesare});
}


class RepeatCycleEvent extends BottomSheetEvent{
 bool repeat;
 String whichOption="Daily";
 bool Frequency=false;
 int numberPickervalue=0;
 bool setEndDate=false;
 int monthIndex=DateTime.now().month;
 Set<int> onWhichDaysIfweeklu={};
  RepeatCycleEvent({required this.repeat,this.whichOption = 'Daily',this.Frequency=false,this.numberPickervalue=0,this.setEndDate=false,this.monthIndex=3,required this.onWhichDaysIfweeklu});
}