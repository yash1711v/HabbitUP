import 'package:intl/intl.dart';

import '../LocalStorage/SharedPref/Sharedpref.dart';
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
  "Custom": {
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
      "changableunits": "Pages",
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
      "changableunits": "times",
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
      "changableunits": "times",
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
      "changableunits": "min",
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
      "changableunits": "cups",
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
  "Loved Ones": {
    "Call a friend": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Call_a_Friend_icon.svg"
    },
    "Call Parents": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Call_parents_Icon.svg"
    },
    "Call sibling": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Call_parents_Icon.svg"
    },
    "Family time": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Family_time_icon.svg"
    },
    "Mini vacation": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/LovedOnes/Mini_Vacation_Icon.svg"
    },
  },
  "Personal Finance": {
    "Track expenses": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Track_Personal_Expense_Icon.svg"
    },
    "Pay bills": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Pay_Bills_Icons.svg"
    },
    "Donate": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Donate_Icon.svg"
    },
    "Read finance news": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Read_Finance_new_Icon.svg"
    },
    "No impulse shopping": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/No_impluse_Shoping.svg"
    },
    "Limit dining out": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Limit_Dining_out_Icon.svg"
    },
    "Save 10% of income": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/PersonalFinance/Save_10%_Of_Incone_Icon.svg"
    },
  },
  "Others": {
    "Study": {
      "properties": [
        "Repeats every day",
        "Target study hours"
            "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "Hours",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Study_Icon.svg"
    },
    "Brush 2 times a day": {
      "properties": [
        "Repeats every day",
        "No. of times to brush",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "Number",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Brush_2_times_Icon.svg"
    },
    "Clean room": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Clean_Room_Icon.svg"
    },
    "Engage in hobbies": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Engage_in_Hobbies_Icon.svg"
    },
    "Positive self talk": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)"
            "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Positive_Self_Talk_Icon.svg"
    },
    "Empty inbox": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Empty_Inbox_Icon.svg"
    },
    "Make your bed": {
      "properties": [
        "Repeats every day",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": " ",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Make_your_Bed_Icon.svg"
    },

    "Positive affirmations": {
      "properties": [
        "Repeats every day",
        "Set a target (in mins.)"
            "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "min",
      "Icon":
      "assets/ImagesY/RoutineScreen/AddhabbitIcons/Others/Positive_Affermation_icon.svg"
    },

  },

};
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


  void updateHabit(String habitName, int selectedColorIndex, String habitIcon) {
    Habbits["Custom"]!.putIfAbsent(habitName, () => {
      "colors": selectedColorIndex,
      "icon": habitIcon,
      "properties": [
        "Repeats every day",
        "Set a target",
        "Time: All day",
        "No Reminder",
        "Morning Routine"
      ],
      "changableunits": "",
    });
    Habbits["Custom"]!.update(
        habitName,
            (value) =>
        {
          "colors": selectedColorIndex,
          "icon": habitIcon,
          "properties": [
            "Repeats every day",
            "Set a target",
            "Time: All day",
            "No Reminder",
            "Morning Routine"
          ],
          "changableunits": "",
        },

    );
  }

}
