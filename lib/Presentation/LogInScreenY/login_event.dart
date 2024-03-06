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