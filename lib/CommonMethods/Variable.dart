import 'package:intl/intl.dart';

late Set<int> DaysofWeek={0};
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

Set<int> DatesForMonth={};

late bool setEndDate=false;
late int frequencyNumber=0;

String endDate="31-12-2024";