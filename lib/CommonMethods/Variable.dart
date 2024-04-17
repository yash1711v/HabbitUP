import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Presentation/MainScreen/Pages/Routine/SubScreens/stacking_cards.dart';
import 'Methods.dart';








//----------------------------Routine Screen Variables--------------------------
DateTime selectedDate = DateTime.now();




//--------------------habit adisionscreen Variables
List<String> Properties = Habbits[
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

String startTime="0000";
 String endTime="0000";

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

Set<String> Subtasks={};


//----------------------------------------------------------------- this is to save the Habit in the Map for user--------------------------------
class UserhabitScreenController extends GetxController{
  RxMap<String,dynamic> UserHabit=RxMap<String,dynamic>();
}

late BuildContext contextRoutineScreen;
late BuildContext contextProgress;
final UserhabitScreenController userhabitScreenController = Get.find<UserhabitScreenController>();
 List<Widget> fancyCards = generateHabitCards(userHabit: userhabitScreenController.UserHabit.value, state: '', selectedDate: selectedDate);

String whichState = "All";


//-------------------------------Settings Screen variables----------------------------

