part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginUnSuccessState extends LoginState {
  String error;
  LoginUnSuccessState({required this.error});
}

class WrongEmailState extends LoginState {
  String error;
  WrongEmailState({required this.error});
}

class WrongPassState extends LoginState {
  String error;
  WrongPassState({required this.error});
}

class ActiveLoginButtom extends LoginState{
  bool Active;

  ActiveLoginButtom(this.Active);
}



