import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../FirebaseFunctionality/AuthenticationFeatures.dart';
import '../../LocalStorage/SharedPref/Sharedpref.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    //Checking for Email Validation
    on<SignupEmailTextchangeEvent>((event, emit) {
      String Error="";
      bool isValid=EmailValidator.validate(event.email);
      if(isValid){

      }else{
        Error="Invalid ID";
      }
      emit(WrongEmailStateSignUp(error: Error));
    });

    //Checking for Pass Validation
    on<SignupPassTextchangeEvent>((event, emit) {
      String Error="";
      if(event.Pass.length>=8){
      }else{
        Error="Password should be of minimum 8 characters";
      }
      emit(WrongPassStateSignUp(error: Error));
    });

    on<SignupUserNameTextchangeEvent>((event, emit) {
      String Error="";
      if(checkUsername(event.username)&&event.username.length>=5){
      }else{
        Error="Username should have atleast 5 characters(Only Alphabets)";
      }
      emit(WrongUsernameStateSignUp(error: Error));
    });

    on<ActiveSignupButtonEvent>((event, emit) {
      bool isValid=EmailValidator.validate(event.email);
      if(isValid && event.Pass.length>=8 && event.Username.length>=5){

        emit(ActiveSignupButtomSignup(true));

      }else{

      }
    });

    on<SignupButtonClickedEvent>((event, emit) async {
      bool emailvalid=EmailValidator.validate(event.email);
      bool passvalid=false;
      bool Guest=await Sharedpref().getGuest();
      if(event.Pass.length>=8 && event.Pass.isNotEmpty){
        passvalid=true;
      }
      if(emailvalid && passvalid ){
        emit(SignupLoadingState());
        String Statues="";
         AuthenticationFeatures().SignUp(event.email, event.Pass,event.context, Guest,event.Username).then((value) {
          Statues=value;
          print("Status $Statues");

        });

      }else{
        String content="";
        if(!emailvalid && !passvalid){
          content="Please Enter valid Password and Email address";
        }else{
          if (!emailvalid) {
            content = "Please Enter Valid Email";
          } else if (!passvalid) {
            content = "Password Must be 8 character Long";
          }
        }
        ScaffoldMessenger.of(event.context).showSnackBar(  SnackBar(

            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              // side: BorderSide(width: borderWidth, color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            content: Text(content,style: TextStyle(color: Colors.black),)));
      }

    });

    on<GooggleSignupButton>((event, emit) async {
      bool Guest=await Sharedpref().getGuest();
      AuthenticationFeatures().signInWithGoogle(event.context, Guest);
    });
  }
  bool checkUsername(String username) {
    // Define a regular expression pattern to match alphanumeric characters, dots, and underscores
    RegExp regExp = RegExp(r'^[a-zA-Z0-9]+(?:_[a-zA-Z0-9]+)*$');

    // Use the hasMatch method to check if the username matches the pattern
    return regExp.hasMatch(username);
  }

}
