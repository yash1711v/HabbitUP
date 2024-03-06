
import 'package:flutter/cupertino.dart';

@immutable
abstract class ThemeEvent{}
class updateEvent extends ThemeEvent{
  String theme;

  updateEvent({required this.theme});
}

class ThemeSelectionEvent extends ThemeEvent{
  BuildContext context;

  ThemeSelectionEvent({required this.context});
}