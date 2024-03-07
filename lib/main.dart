import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'MyTheme/MyThemeData.dart';
import 'MyTheme/theme_bloc.dart';
import 'MyTheme/theme_event.dart';
import 'Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ThemeBloc>(context).add(updateEvent(theme: "DarkMode"));
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
        return MaterialApp(
          theme: theme,
          onGenerateRoute: Routes().OnGenerateRoute,
          initialRoute: "/Initial",
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
