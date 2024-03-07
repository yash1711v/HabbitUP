import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../LocalStorage/SharedPref/Sharedpref.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralInitial()) {
    on<checkisAuthenticated>((event, emit) async {
      bool isOnboarding = await Sharedpref().getOnBoarding()??false;
      String uid=await Sharedpref().getUid();
      bool Guest=await Sharedpref().getGuest()??false;
      bool DetailsDone=await Sharedpref().getDetails()??false;
      int Date= await Sharedpref().getFeelingsDate();
     if(isOnboarding){
       if( (uid!=null && uid.isNotEmpty) || Guest){
         print("${(uid!=null && uid.isNotEmpty)} ${Guest}");
         if(DetailsDone){
           if(Date!=DateTime.now().day){
             Navigator.of(event.context).pushReplacementNamed("/FeelingsSelection");
           }else{
             Navigator.of(event.context).pushReplacementNamed("/MainScreen");

           }
           }else{
           Navigator.of(event.context).pushReplacementNamed("/AvatarScreen");
         }
       }else {
         print("${(uid!=null && uid.isNotEmpty)} ${Guest}");
         Navigator.of(event.context).pushReplacementNamed("/SignupScreen");
        }
      }else{
       Navigator.of(event.context).pushReplacementNamed("/onBoarding");

     }
    });
  }
}