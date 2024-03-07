part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class loginEmailTextchangeEvent extends LoginEvent {
  String email;

  loginEmailTextchangeEvent({required this.email});
}

class loginPassTextchangeEvent extends LoginEvent {
  String Pass;
  loginPassTextchangeEvent({required this.Pass});
}

class loginButtonClickedEvent extends LoginEvent {
 String email;
 String Pass;
 BuildContext context;

 loginButtonClickedEvent({required this.email, required this.Pass, required this.context});
}

class ActiveLoginButtonEvent extends LoginEvent{
  String email;
  String Pass;

  ActiveLoginButtonEvent({required this.email, required this.Pass});
}

class GooggleLoginButton extends LoginEvent {
  BuildContext context;

  GooggleLoginButton({required this.context});
}

class ForgoButtonCalled extends LoginEvent {
  ForgoButtonCalled();
}

class ForgoButtonPressed extends LoginEvent {
  String email;
  BuildContext context;

  ForgoButtonPressed({required this.context,required this.email});
}

class ForgotEmailTextchangeEvent extends LoginEvent {
  String email;

  ForgotEmailTextchangeEvent({required this.email});
}

class RememberEvent extends LoginEvent{}


