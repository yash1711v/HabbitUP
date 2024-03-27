import 'Methods.dart';
//--------------------habit adisionscreen Variables
List<String> Properties = Methods().Habbits[
SelectedCatagory]![selectedHabit]!['properties'];
int SelectedIndex = SelectedColorIndex;

//--------------------------Repeats Every Day Habit--------------------------------

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
int monthIndex=0;
Set<int> DatesForMonth={};
late bool setEndDate=false;
late int frequencyNumber=0;
String whichOption="";
String endDate="";



//-----------------------------Duration of habbit variables---------------------
bool durationOfHabit=false;

String time="All Day";

String startTime="";
 String endTime="";

 bool setEndTime=false;
String target="30";
 //---------------------------set Reminder  variables --------------------------

bool SetReminder=false;

String ReminderAt="";

bool MultipleReminders=false;

Set<String> Reminders={};

DateTime addedTime=DateTime.now();

//-----------------------------List of Tags for TagBottomSheet-------------------
List<String> Tags=[
  "Morning routine",
  "Healthy Lifestyle",
  "Staying Fit",
  "Stress Relief",
  "Loved Ones",
  "Personal Finance",
  "Others",
];
int SelectedIndexfortags=0;
