import 'dart:convert';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../CommonMethods/Variable.dart';

class Sharedpref{


// setting and getting of onBoarding
  setOnBoarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("onBoarding", value);

  }

  getOnBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool IsDone = pref.getBool("onBoarding")??false;
    return IsDone;
  }
  // setting and getting of Guest
  setGuest(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("Guest", value);

  }

  getGuest() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool IsGuest = pref.getBool("Guest")??false;
    return IsGuest;
  }

  // setting and getting of DetailsDone
  setDetails(bool value) async {
    print("Set Details Done Called");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("DetailsDone", value);

  }

  getDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool DetailsDone = pref.getBool("DetailsDone")??false;
    return DetailsDone;
  }



  // setting and getting of Feelings
  setFeelings(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Feelings", value);

  }

  getFeelings() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String Feelings = pref.getString("Feelings")??"";
    return Feelings;
  }



  //Setting and getting of  Uid
  setUid(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("Uid", value);
  }

  getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String Uid = prefs.getString("Uid")??"";
   return Uid;
  }

  //Setting and getting of  Username
  setUsername(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Username", value);
  }

  getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Username = prefs.getString("Username")??"";
    return Username;
  }

  //Setting and getting of  Email
  setEmail(String value) async {
    print("Email id coming to save is ---> $value");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Email", value);
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("Email")??"";
    print("Email id giving from to sharedpref is ---> $email");

    return email;
  }

  //Setting and getting of  Password
  setPass(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Password", value);
  }

  getPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Pass = prefs.getString("Password")??"";
    return Pass;
  }


  //Setting Date for Feelings Screen

 setFeelingsScreenDate(int value) async {
    final SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setInt("FeelingsDate", value);
 }

 getFeelingsDate()async{
   final SharedPreferences prefs=await SharedPreferences.getInstance();
   int Date=prefs.getInt("FeelingsDate")??32;
   return Date;

 }


  Future<void> storeMood(String mood) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String date = "${now.day}-${now.month}-${now.year}";

    // Retrieve existing mood map or create a new one if it doesn't exist
    Map<String, String> moodMap = {};

    getMoodMap().then((value) {
      moodMap=value;
    });


    // Update or add mood value for the current date
    moodMap[date] = mood;

    // Store the updated mood map back to SharedPreferences
    await prefs.setString('MoodMap', json.encode(moodMap));
    print('Mood stored successfully for date $date: $mood');
  }

   Future<Map<String, String>> getMoodMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve existing mood map or create a new one if it doesn't exist
    // Retrieve existing mood map or create a new one if it doesn't exist
    // Retrieve existing mood map or create a new one if it doesn't exist
    Map<String, dynamic>? jsonMap = prefs.getString('MoodMap') != null
        ? json.decode(prefs.getString('MoodMap')!) as Map<String, dynamic>
        : null;

    Map<String, String> moodMap = jsonMap != null
        ? jsonMap.map((key, value) => MapEntry(key, value.toString()))
        : {};


    return moodMap;
  }

  //Saving Theme To local Storage As weel

  setThemeData(String value) async {
    print("Seeting Theme");
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString("ThemeData", value);
  }

  getThemeData()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    String Theme=prefs.getString("ThemeData")??"DarkMode";
    print("geting Theme ${Theme}");
    return Theme;

  }


  void saveData(Map<String, dynamic> data) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();


    String jsonData = jsonEncode(data);
    prefs.setString('data', jsonData);
  }

  Future<Map<String, dynamic>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('data');
    if (jsonData != null) {
      Map<String, dynamic> decodedData = jsonDecode(jsonData);


      return decodedData;
    }
    return {};
  }

  Future<void> saveHabits(Map<String, Map<String, Map<String, dynamic>>> habits) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert the nested map to a JSON string
    String habitsString = json.encode(habits);

    // Store the JSON string in SharedPreferences
    await prefs.setString('habits', habitsString);
  }



  Future<Map<String, Map<String, Map<String, dynamic>>>> loadHabits() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from SharedPreferences
    String? habitsString = prefs.getString('habits');

    // If there's no stored data, return a default map
    if (habitsString == null || habitsString.isEmpty) {
      // Return an alternative default map if desired
      return {
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
    }

    // Decode the JSON string back to a nested map
    Map<String, dynamic> jsonMap = json.decode(habitsString);

    // Properly cast the decoded map
    return jsonMap.map((key, dynamic value) {
      return MapEntry(
          key,
          (value as Map).map((key2, dynamic value2) {
            return MapEntry(
                key2,
                (value2 as Map).cast<String, dynamic>()
            );
          })
      );
    });
  }



}


