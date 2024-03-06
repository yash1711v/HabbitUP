import 'package:intl/intl.dart';

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
}