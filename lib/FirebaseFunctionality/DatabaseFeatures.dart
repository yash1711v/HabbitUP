import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HabitUp/CommonMethods/Variable.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';

class DatabaseFeatures{
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("users");
  writeToDatabase({
    required String Uid,
    required String username,
    required String Email,
    required String Password,
    required String Feeling,
    required BuildContext context,required Map<String, dynamic> UserHabits

  }) async {
    databaseReference.child(Uid).set({
      'username': username,
      'Email': Email,
      'password': Password,
      "Feelings": Feeling,
      "UserHabits":UserHabits,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar (   const SnackBar(

          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: Text("Data saved successfully",style: TextStyle(color: Colors.black),)));
    });
  }

   Future<bool> updateFeelings({required String feelings,required String Uid}) async {
     databaseReference.child(Uid).update(
       {
         "Feelings":feelings
       }
     ).then((value) {return true;});

     return false;
   }

   void updateUserhabits({required Map<String, dynamic> UserHabits,required String Uid}){
    print("--------------->Updating values");
    String userData=jsonEncode(UserHabits);

    databaseReference.child(Uid).update(
        {
          "UserHabits":userData
        }
      ).then((value) {return true;});
   }

   Future<Map<String, dynamic>> getUserhabits ({required String Uid}) async {
     Map<String, dynamic> UserHabits = {};
     String? UserHabitsDataJson = "";
     DatabaseReference databaseReference = FirebaseDatabase.instance
         .reference()
         .child('users')
         .child(Uid)
         .child('UserHabits');
     try {
       DatabaseEvent event = await databaseReference.once();
       event.snapshot.value;
       print(event.snapshot.value);
       UserHabitsDataJson = event.snapshot.value.toString();
       UserHabits = json.decode(UserHabitsDataJson);
       Sharedpref().saveData(UserHabits);
       UserhabitScreenController().UserHabit.value=UserHabits;
     } catch (e) {
       print('Error: $e');
     }
     return UserHabits;
   }

  // Future<Map<String, dynamic>> getUserHabits() async {
  //
  // }
}

