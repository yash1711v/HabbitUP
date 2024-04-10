import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:habitup/CommonMethods/Methods.dart';
import 'package:habitup/LocalStorage/SharedPref/Sharedpref.dart';

import 'CommonMethods/Variable.dart';
import 'MyTheme/MyThemeData.dart';
import 'MyTheme/theme_bloc.dart';
import 'MyTheme/theme_event.dart';
import 'Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

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
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  await Sharedpref().loadData().then((value) {
    print(value.length);
    userhabitScreenController.UserHabit.value=value;
  });
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

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
