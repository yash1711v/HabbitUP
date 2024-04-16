part of 'add_habit_bloc.dart';

@immutable
abstract class AddHabitEvent {}

class SearchBarTappedEvent extends AddHabitEvent{
 final bool isTapped;

  SearchBarTappedEvent({required this.isTapped});
}

class StayingFitClickedEvent extends AddHabitEvent{
 bool StayingFirOpened;

 StayingFitClickedEvent({required this.StayingFirOpened});
}
class StressReliefClickedEvent extends AddHabitEvent{
 bool StressReliefOpend;

 StressReliefClickedEvent({required this.StressReliefOpend});
}

class HealthyLifeStyleClickedEvent extends AddHabitEvent{
 bool HealthyLifeStyleOpend;
 HealthyLifeStyleClickedEvent({required this.HealthyLifeStyleOpend});
}

class LovedOnesClickedEvent extends AddHabitEvent{
 bool LovedOnesOpend;

 LovedOnesClickedEvent({required this.LovedOnesOpend});
}
class PersonalFinanceEvent extends AddHabitEvent{
 bool PersonalFinanceOpened;

 PersonalFinanceEvent({required this.PersonalFinanceOpened});
}
class OthersEvent extends AddHabitEvent{
 bool OthersOpened;

 OthersEvent({required this.OthersOpened});


}
class CustomEvent extends AddHabitEvent{
 bool CustomOpened;

 CustomEvent({required this.CustomOpened});


}



