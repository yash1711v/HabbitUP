part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupEmailTextchangeEvent extends SignupEvent {
  String email;

  SignupEmailTextchangeEvent({required this.email});
}
class SignupUserNameTextchangeEvent extends SignupEvent {
  String username;

  SignupUserNameTextchangeEvent({required this.username});
}

class SignupPassTextchangeEvent extends SignupEvent {
  String Pass;
  SignupPassTextchangeEvent({required this.Pass});
}

class SignupButtonClickedEvent extends SignupEvent {
  String email;
  String Pass;
  String Username;
  BuildContext context;

  SignupButtonClickedEvent({required this.email, required this.Pass, required this.context,required this.Username});
}

class ActiveSignupButtonEvent extends SignupEvent{
  String email;
  String Pass;
  String Username;

  ActiveSignupButtonEvent({required this.email, required this.Pass,required this.Username,});
}

class GooggleSignupButton extends SignupEvent {
  BuildContext context;

  GooggleSignupButton({required this.context});
}
