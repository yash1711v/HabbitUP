import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../ScheduleNotifications/notification_scheduler.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  AndroidNotificationChannel channel=AndroidNotificationChannel(
    'HabitUp',
    'HabitUp',
    importance: Importance.max,
    showBadge: false,
  );


  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart: true,
          onForeground: onStart,
          onBackground: onBackGround
      ),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          isForegroundMode: true,
          autoStartOnBoot: true,
          autoStart: true,
          foregroundServiceNotificationId: 888
      ));
  service.startService();
}
Future<void> stopBackgroundService() async {
  final service = FlutterBackgroundService();
  service.invoke('stopService');
}
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async{
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  flutterLocalNotificationsPlugin.cancelAll();


  Timer.periodic(Duration(seconds: 1), (timer) async {
    DateTime now=DateTime.now();
    bool isMidnight = now.hour == 0 && now.minute == 0;

    Map<String,dynamic> Userhabits=await Sharedpref().loadData();
    String currentdate=DateFormat("dd-MM-yyyy").format(DateTime.now());
   int i=0;
    if(isMidnight) {
      flutterLocalNotificationsPlugin.cancelAll();
      print("is Mid Night is $isMidnight");
      Userhabits.forEach((key, value) {
        print("inside firest  loop");
        value.forEach((element) {
          print("inside each catogary  loops ");
          element.forEach((key1, value2) {
            print("inside habit list loops ");
            value2["dates"].forEach((key, value3) {
              print("inside each habit Map loops ");
              if (key == DateFormat('MMMM').format(DateTime.now())) {
                print("inside if key matches the current month");
                print(DateFormat('MMMM').format(DateTime.now()));
                if (value3.contains(DateTime.now().day)) {
                  print("inside if date have current month and current date ");

                  if (value2["Reminders"] != null && value2["Reminders"] != {}) {
                    print("inside if reminders are not null and not empty");
                    value2["Reminders"].forEach((element) async {
                      i=i++;
                      print("Scheduling alarm");
                      DateTime scheduledTime = DateFormat('MMMM d, yyyy hh:mm a')
                          .parse(
                          '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().day}, ${DateTime.now().year} $element');
                      // Get the device's local time zone
                      final location = tz.getLocation('Asia/Kolkata'); // Indian time zone
                      tz.TZDateTime scheduledTZTime = tz.TZDateTime(tz.local, DateTime.now().year, now.month, now.day, extractHour(element), extractMinute(element),0);
                      // tz.TZDateTime.from(scheduledTime, location);
                      await flutterLocalNotificationsPlugin
                          .zonedSchedule(
                        0, // Use unique ID
                        '$key1',
                        'Add Progress To Your Habit',
                        scheduledTZTime,
                        const NotificationDetails(
                          android: AndroidNotificationDetails(
                              'Habit reminder',
                              'Habit reminder notification',
                              importance: Importance.max,
                              priority: Priority.high,
                              color: Colors.red),
                        ),
                        androidAllowWhileIdle: true,
                        uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                        matchDateTimeComponents: DateTimeComponents.time,
                      )
                          .catchError((error) {
                        print('Error scheduling notification: $error');
                      }).then((value) async {
                        final pendingNotifications =
                            await flutterLocalNotificationsPlugin.pendingNotificationRequests();
                        print(
                            'Scheduled notification at: $pendingNotifications ');
                      });
                    });

                    print(value2["Reminders"]);
                  }
                  ;
                }
              }
            });
          });
        });
      });
    }
  });

}

@pragma('vm:entry-point')
Future<bool>  onBackGround(ServiceInstance service) async{
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}
int extractHour(String element) {
  // Splitting the string by spaces to separate time and period (AM/PM)
  List<String> parts = element.split(' ');
  // Further splitting by colon to separate hours and minutes
  String hourPart = parts[0].split(' : ')[0].trim(); // Trimming to remove any extra spaces
  return int.parse(hourPart); // Convert to integer
}

// Method to extract the minute from the time string
int extractMinute(String element) {
  // Splitting the string by spaces to separate time and period (AM/PM)
  List<String> parts = element.split(' ');
  // Further splitting by colon to separate hours and minutes
  String minutePart = parts[0].split(' : ')[1].trim(); // Trimming to remove any extra spaces
  return int.parse(minutePart); // Convert to integer
}