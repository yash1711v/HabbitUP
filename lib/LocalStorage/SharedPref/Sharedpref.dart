import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
  // setting and getting of Wakeuptime
  setWakeupTime(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("WakeupTime", value);

  }

  getWakeUpTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String WakeUpTime = pref.getString("WakeupTime")??"";
    return WakeUpTime;
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
  // setting and getting of Gender
  setGender(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Gender", value);

  }

  getGender() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String Gender = pref.getString("Gender")??"";
    return Gender;
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

}


