import 'package:intl/intl.dart';

import '../LocalStorage/SharedPref/Sharedpref.dart';

class Methods {
  String separateDate(String datetimeString) {
    DateTime dateTime = DateTime.parse(datetimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

// Method to separate time from the datetime string
  String separateTime(String datetimeString) {
    DateTime dateTime = DateTime.parse(datetimeString);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

  //Global Method To fetch the theme
  Future<String> getThemeData() async {
    String ThemeData = await Sharedpref().getThemeData();
    return ThemeData;
  }

  //Map of All Habbits
  Map<String, Map<String, Map<String, dynamic>>> Habbits = {
    "Staying fit": {
      "Morning Walk": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Morning_Walk.svg"
      },
      "Go for a run": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Morning_Walk.svg"
      },
      "Exercise": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/ExcerciseIcon.svg"
      },
      "Hit the gym": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Hit_Gym_Icon.svg"
      },
      "Do cardio": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Cardio_Icon.svg"
      },
      "Dance workout": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Dance_Icon.svg"
      },
      "Play a sport": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Play_Sport_Icon.svg"
      },
      "Ride a bike": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Ride_Bike_Icon.svg"
      },
      "Go for a swim": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StayingFitIcons/Go_For_Swimming_Icon.svg"
      },
    },
    "Stress Relief": {
      "Meditate": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Meditate.svg"
      },
      "Read A Book": {
        "properties": [
          "Repeats every day",
          "No. of pages to read",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Read_A_book_Icon.svg"
      },
      "Write in journal": {
        "properties": [
          "Repeats every day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": " ",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Write_Journel_Icon.svg"
      },
      "Pray": {
        "properties": [
          "Repeats every day",
          "How many times a day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Pray_Icon.svg"
      },
      "Be grateful": {
        "properties": [
          "Repeats every day",
          "How many times a day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Be_A_GreatFull_Icon.svg"
      },
      "Digital detox": {
        "properties": [
          "Repeats every day",
          "How many minutes a day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Digital_Detox_Icon.svg"
      },
      "Enjoy sunrise": {
        "properties": [
          "Repeats every day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": " ",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Enjoy_SunRise_Icon.svg"
      },
      "Practice yoga": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Practice_Yoga_Icon.svg"
      },
      "Learn a skill": {
        "properties": [
          "Repeats every day",
          "Set a target (in mins.)",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "min",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/StressRelief/Learn_Skills_Icon.svg"
      },
    },
    "Healthy LifeStyle": {
      "Drink water": {
        "properties": [
          "Repeats every day",
          "No. of cups of water/day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Drop_Icon.svg"
      },
      "Eat fruits": {
        "properties": [
          "Repeats every day",
          "How many fruits/day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Fruit_Icon.svg"
      },
      "Eat salad": {
        "properties": [
          "Repeats every day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": " ",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Salad_Icon.svg"
      },
      "Sleep Early": {
        "properties": [
          "Repeats every day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": " ",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Sleep_Early_Icon.svg"
      },
      "Eat healthy meals": {
        "properties": [
          "Repeats every day",
          "How many times a day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Eat_Health-Meals.svg"
      },
      "Limit caffiene": {
        "properties": [
          "Repeats every day",
          "No. of cup of coffee/day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/limit_Caffien_icon.svg"
      },
      "Limit fried food": {
        "properties": [
          "Repeats every day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": " ",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/limit_Fried_Food.svg"
      },

      "Limit sugar": {
        "properties": [
          "Repeats every day",
          "How many times a day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Limit_Sugar_Icons.svg"
      },

      "Quit smoking": {
        "properties": [
          "Repeats every day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": " ",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Quit_Smoking_Icon.svg"
      },
      "Skincare routine": {
        "properties": [
          "Repeats every day",
          "How many times a day",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Number",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Skin_care_icon.svg"
      },
      "Sleep 8 hours": {
        "properties": [
          "Repeats every day",
          "Target sleep hours",
          "Time: All day",
          "No Reminder",
          "Morning Routine"
        ],
        "changableunits": "Hours",
        "Icon":
            "assets/ImagesY/RoutineScreen/AddhabbitIcons/HealthyLifeStyle/Sleep_8_Hours_Icon.svg"
      },
    },


  };
}
