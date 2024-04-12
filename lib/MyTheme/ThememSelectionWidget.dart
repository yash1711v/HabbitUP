import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HabitUp/MyTheme/theme_bloc.dart';
import 'package:HabitUp/MyTheme/theme_event.dart';


class ThemeSelectorBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        String selectedIndex = "System Default";
        if(state is LightThemeState){
          selectedIndex=state.selectedvalue;
        }else if(state is DarkThemeState){
          selectedIndex=state.selectedvalue;
        }else if(state is SystemDefaultThemeState){
          selectedIndex=state.selectedvalue;
        }
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile(
                title: Text('System Default',  style:    TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
                ),
                value: "System Default",
                groupValue: selectedIndex,
                onChanged: (value) {
                  BlocProvider.of<ThemeBloc>(context).add(updateEvent(theme: "System Default"));
                },
              ),
              RadioListTile(
                title: Text('Light',style:    TextStyle(color: Theme.of(context).textTheme.bodyText2?.color)),
                value: "LightTheme",
                groupValue: selectedIndex,
                onChanged: (value) {
                  BlocProvider.of<ThemeBloc>(context).add(updateEvent(theme: "LightTheme"));

                },
              ),
              RadioListTile(
                title: Text('Dark',style:    TextStyle(color: Theme.of(context).textTheme.bodyText2?.color)),
                value: "DarkMode",
                groupValue: selectedIndex,
                onChanged: (value) {
                  BlocProvider.of<ThemeBloc>(context).add(updateEvent(theme: "DarkMode"));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
