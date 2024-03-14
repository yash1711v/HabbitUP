import 'package:intl/intl.dart';

import '../LocalStorage/SharedPref/Sharedpref.dart';

class Methods{

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
  Future<String>getThemeData() async {
    String ThemeData=await Sharedpref().getThemeData();
    return ThemeData;
  }
}