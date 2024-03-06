import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseFeatures{
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("users");
  writeToDatabase({
    required String Uid,
    required String username,
    required String Email,
    required String Password,
    required String Feeling,
    required BuildContext context,

  }) async {
    databaseReference.child(Uid).set({
      'username': username,
      'Email': Email,
      'password': Password,
      "Feelings": Feeling,
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
}