import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:HabitUp/CommonMethods/Methods.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CommonMethods/Variable.dart';
import 'MyTheme/MyThemeData.dart';
import 'MyTheme/theme_bloc.dart';
import 'MyTheme/theme_event.dart';
import 'Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'background_services/backservices.dart';
import 'firebase_options.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
gettheme(BuildContext context) async {
  String ThemeDate= await Sharedpref().getThemeData();
  BlocProvider.of<ThemeBloc>(context).add(updateEvent(theme: ThemeDate));
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserhabitScreenController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionStatus status2=await Permission.notification.request();

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  await Sharedpref().loadData().then((value) {
    print(value.length);
    userhabitScreenController.UserHabit.value=value;
  });
  await Sharedpref().loadHabits().then((value) {
    print(value['Custom']);
    Habbits=value;
  });
  await initializeService();
  // await AndroidAlarmManager.initialize();
  // final int helloAlarmID = 200;
  // await AndroidAlarmManager.periodic(
  //     const Duration(seconds: 1), helloAlarmID, SettingNotification);


  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

// @pragma('vm:entry-point')
// Future<void> SettingNotification() async {
//   print("helooo");
//   DateTime now=DateTime.now();
//   bool isMidnight = now.hour == 0 && now.minute == 0;
//   print("midnight --------> $isMidnight");
//   if(isMidnight) {
//
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context)  {
    gettheme(context);
    final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).platformBrightness;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        ThemeData theme=MyAppTheme.lightTheme;
       if(state is LightThemeState){
         theme=MyAppTheme.lightTheme;
       }else if(state is DarkThemeState){
          theme=MyAppTheme.darkTheme;
        }else{
          if (brightness == Brightness.dark){
            theme=MyAppTheme.darkTheme;
          }else{theme=MyAppTheme.lightTheme;}
        }
        print(theme);
        return GetMaterialApp(
          theme: theme,
          onGenerateRoute: Routes().onGenerateRoute,
          initialRoute: "/Initial",
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
