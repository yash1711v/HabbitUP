part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent {}


class checkisAuthenticated extends GeneralEvent{
BuildContext context;

checkisAuthenticated(this.context);
}


