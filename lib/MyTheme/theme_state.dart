part of 'theme_bloc.dart';



@immutable
abstract class ThemeState {}
class LightThemeState extends ThemeState {
  String selectedvalue="LightTheme";
}

class DarkThemeState extends ThemeState {
  String selectedvalue="DarkMode";
}

class SystemDefaultThemeState extends ThemeState {
  String selectedvalue="System Default";
}

