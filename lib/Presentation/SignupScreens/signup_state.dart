part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}


class SignupSuccessState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupUnSuccessState extends SignupState {
  String error;
  SignupUnSuccessState({required this.error});
}

class WrongUsernameStateSignUp extends SignupState {
  String error;
  WrongUsernameStateSignUp({required this.error});
}


class WrongEmailStateSignUp extends SignupState {
  String error;
  WrongEmailStateSignUp({required this.error});
}

class WrongPassStateSignUp extends SignupState {
  String error;
  WrongPassStateSignUp({required this.error});
}

class ActiveSignupButtomSignup extends SignupState{
  bool Active;

  ActiveSignupButtomSignup(this.Active);
}
