import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../FirebaseFunctionality/AuthenticationFeatures.dart';
import '../../LocalStorage/SharedPref/Sharedpref.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    //Checking for Email Validation
  on<loginEmailTextchangeEvent>((event, emit) {
    String Error="";
    bool isValid=EmailValidator.validate(event.email);
    if(isValid){

    }else{
      Error="Invalid ID";
    }
    emit(WrongEmailState(error: Error));
  });

  //Checking for Pass Validation
  on<loginPassTextchangeEvent>((event, emit) {
    String Error="";
    if(event.Pass.length>=8){
    }else{
      Error="Password should be of minimum 8 characters";
    }
    emit(WrongPassState(error: Error));
  });
  on<ActiveLoginButtonEvent>((event, emit) {
    bool isValid=EmailValidator.validate(event.email);
    if(isValid && event.Pass.length>=8){
      emit(ActiveLoginButtom(true));

    }else{

    }
  });

  on<loginButtonClickedEvent>((event, emit) async {
    bool emailvalid=EmailValidator.validate(event.email);
    bool passvalid=false;
    bool Guest=await Sharedpref().getGuest();
    if(event.Pass.length>=8 && event.Pass.isNotEmpty){
      passvalid=true;
    }
     if(emailvalid && passvalid ){
       emit(LoginLoadingState());
       String Statues="";
       AuthenticationFeatures().Login(event.email, event.Pass,event.context, Guest,).then((value) {
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

  on<GooggleLoginButton>((event, emit) async {
    bool Guest=await Sharedpref().getGuest();
    AuthenticationFeatures().signInWithGoogle(event.context, Guest);
  });
  }
}
