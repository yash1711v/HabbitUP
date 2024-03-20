import 'package:intl/intl.dart';

late Set<int> DaysofWeek={};
late String selectedHabit;
late String SelectedHabitIcon;
late String SelectedCatagory;
late int SelectedColorIndex=0;
late Map<String,Set<int>>datesOnwhichTheHabbitsAreSet={
  "January":{},
  "February":{},
  "March":{},
  "April":{},
  "May":{},
  "June":{},
  "July":{},
  "August":{},
  "September":{},
  "October":{},
  "November":{},
  "December":{},
};