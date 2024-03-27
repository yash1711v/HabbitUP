import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationScheduler {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> scheduleNotifications(Map<String, Set<int>> dates, Set<String> times) async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');


    final initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {});

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    for (String month in dates.keys) {
      for (int date in dates[month]!) {
        for (String time in times) {
          DateTime scheduledTime = DateFormat('MMMM d, yyyy hh:mm a').parse('$month $date, ${DateTime.now().year} $time');

          // Get the device's local time zone
          final location = tz.getLocation('Asia/Kolkata'); // Indian time zone
          tz.TZDateTime scheduledTZTime = tz.TZDateTime.from(scheduledTime, location);

          // Create unique ID by combining year, month, day, and hour
          String id = DateFormat('yyMMddHH').format(scheduledTime);

          await flutterLocalNotificationsPlugin.zonedSchedule(
            0, // Use unique ID
            'Notification title',
            'Notification body',
            scheduledTZTime,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'Habit reminder',
                'Habit reminder notification',
                importance: Importance.max,
                priority: Priority.high,
                color: Colors.red
              ),
            ),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
            matchDateTimeComponents: DateTimeComponents.time,
          ).catchError((error) {
            print('Error scheduling notification: $error');
          }).then((value) {
            print('Scheduled notification at: $scheduledTZTime with ID: $id');
          });
        }
      }
    }
  }
}
