import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habitup/LocalStorage/SharedPref/Sharedpref.dart';
import '../CommonMethods/Variable.dart';
import '../Presentation/MainScreen/Pages/Routine/SubScreens/stacking_cards.dart';
import 'DatabaseFeatures.dart';

class AuthenticationFeatures {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseFeatures services = DatabaseFeatures();

  //Login with Email and Password
  Future<String> Login(
    email,
    password,
    BuildContext context,
    bool Guest,
  ) async {
    String status = "";
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value1) async {



      if (Guest) {
        services.writeToDatabase(
            Uid: await Sharedpref().getUid(),
            username: await Sharedpref().getUsername(),
            Email: await Sharedpref().getEmail(),
            Password: await Sharedpref().getPass(),
            Feeling: await Sharedpref().getFeelings(),
            context: context, UserHabits: {});
        Future.delayed(Duration(milliseconds: 1000)).then((value) {
          Navigator.of(context).popAndPushNamed("/MainScreen");
        });
      } else {
        services.databaseReference
            .child(value1.user!.uid.toString())
            .once()
            .then((value) async {
          if (value.snapshot.exists) {
            //if exists
            print("If exists");
            //Setting data from the firebase to local storage if exists
            await Sharedpref()
                .setEmail(value.snapshot.child('Email').value.toString());
            await Sharedpref().setUid(value1.user!.uid ?? "");
            await Sharedpref()
                .setUsername(value.snapshot.child('username').value.toString());
            await Sharedpref()
                .setFeelings(value.snapshot.child('Feelings').value.toString());
            await Sharedpref().setPass(value.snapshot.child('password').value.toString());
            DatabaseFeatures().getUserhabits(Uid: value1.user!.uid).then((value) async => {
              fancyCards = generateHabitCards(
                  userHabit: value,
                  state: whichState,
                  selectedDate: selectedDate),
              await Sharedpref().loadData().then((value) {
                print(value.length);
                userhabitScreenController.UserHabit.value=value;
              })

            });
            //showing snackbar
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  // side: BorderSide(width: borderWidth, color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content: Text(
                  "Welcome back",
                  style: TextStyle(color: Colors.black),
                )));

            //Navigating to next Screen aftern 700 milliseconds
            Future.delayed(Duration(milliseconds: 700)).then((value) {
              Navigator.of(context).popAndPushNamed("/FeelingsSelection");
            });

            return "Welcome Back";
          } else {
            print("If not exists");
            Sharedpref().setFeelings("");
            Sharedpref().setUid(value1.user!.uid);
            Sharedpref().setUsername(email);
            Sharedpref().setEmail(email);
            Sharedpref().setEmail(password);

            services.writeToDatabase(
                Uid: await Sharedpref().getUid(),
                username: await Sharedpref().getUsername(),
                Email: await Sharedpref().getEmail(),
                Password: await Sharedpref().getPass(),
                Feeling: await Sharedpref().getFeelings(),
                context: context, UserHabits: {});

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  // side: BorderSide(width: borderWidth, color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content: Text(
                  "Welcome",
                  style: TextStyle(color: Colors.black),
                )));

            Future.delayed(Duration(microseconds: 500)).then((value) {
              Navigator.of(context).popAndPushNamed("/AvatarScreen");
            });
            return "Welcome";
          }
        });
        return "Successfull";
      }
    }).catchError((e) {
      String errorMessage = _extractErrorMessage(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            // side: BorderSide(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(color: Colors.black),
          )));
      print("Error:- " + e.toString());
      return "Error:- " + e.toString();
    });
    return status;
  }

//SignUp with Email and password
  SignUp(
    email,
    password,
    BuildContext context,
    bool Guest,
      String username,
  ) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
          Sharedpref().setEmail(email);
          Sharedpref().setPass(password);
          Sharedpref().setUsername(username);
          Sharedpref().setUid(value.user!.uid);
      if (Guest) {
        services.writeToDatabase(
            Uid: await Sharedpref().getUid(),
      username: await Sharedpref().getUsername(),
      Email: await Sharedpref().getEmail(),
      Password: await Sharedpref().getPass(),
      Feeling: await Sharedpref().getFeelings(),
      context: context, UserHabits: {});
      Future.delayed(Duration(milliseconds: 1000)).then((value) {
      Navigator.of(context).popAndPushNamed("/MainScreen");
      });
      } else {
        services.writeToDatabase(
            Uid: await Sharedpref().getUid(),
            username: await Sharedpref().getUsername(),
            Email: await Sharedpref().getEmail(),
            Password: await Sharedpref().getPass(),
            Feeling: await Sharedpref().getFeelings(),
            context: context, UserHabits: {});

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              // side: BorderSide(width: borderWidth, color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            content: Text(
              "Sign up successfull",
              style: TextStyle(color: Colors.black),
            )));
        Future.delayed(Duration(microseconds: 500)).then((value) {
          Navigator.of(context).popAndPushNamed("/AvatarScreen");
        });
        return "Successfull";
      }
    }).catchError((e) {
      String errorMessage = _extractErrorMessage(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            // side: BorderSide(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(color: Colors.black),
          )));
      print("Error:- " + e.toString());
      return "Error:- " + e.toString();
    });
  }

  // Google sign in and Signup
  signInWithGoogle(BuildContext context, bool isGuest) async {
    await GoogleSignIn().signIn().then((value1) {
      Future.delayed(Duration(seconds: 1)).then((value) async {
        //Authenticating with google to get acces of the account
        final GoogleSignInAuthentication googleSignInAuthentication =
            await value1!.authentication;

        //fetching the user credentials
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        //Authenticating with the coming credentials
        await _auth.signInWithCredential(authCredential).then((value2) async {



          if (isGuest) {
            // if guest then adding the guest data to the firebase
            services.writeToDatabase(
                Uid: await Sharedpref().getUid(),
                username: await Sharedpref().getUsername(),
                Email: await Sharedpref().getEmail(),
                Password: " ",
                Feeling: await Sharedpref().getFeelings(),
                context: context, UserHabits: {});
            Future.delayed(Duration(milliseconds: 1000)).then((value) {
              Navigator.of(context).popAndPushNamed("/MainScreen");
            });
          } else {
            // if not a guest checking whether the data exists or not if yes then simply fetching and setting that data to local storage
            // and other wise Sending the new entries
            print(value1.id.toString());
            services.databaseReference
                .child(value1.id.toString())
                .once().then((value) => {print(value.snapshot.value)});
            services.databaseReference
                .child(value1.id.toString())
                .once()
                .then((value) async {

              if (value.snapshot.exists) {
                //if exists
                print("If exists");
                await Sharedpref()
                    .setEmail(value.snapshot.child('Email').value.toString());
                await Sharedpref().setUid(value1.id ?? "");
                await Sharedpref().setUsername(
                    value.snapshot.child('username').value.toString());
                await Sharedpref().setFeelings(
                    value.snapshot.child('Feelings').value.toString());
                await Sharedpref().setPass(" ");
                DatabaseFeatures().getUserhabits(Uid: value1.id).then((value) async => {
                  fancyCards = generateHabitCards(
                      userHabit: value,
                      state: whichState,
                      selectedDate: selectedDate),
                await Sharedpref().loadData().then((value) {
                print(value.length);
                userhabitScreenController.UserHabit.value=value;
                })

                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(width: borderWidth, color: borderColor),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    content: Text(
                      "Welcome back",
                      style: TextStyle(color: Colors.black),
                    )));
                Future.delayed(Duration(microseconds: 500)).then((value) {
                  Navigator.of(context).popAndPushNamed("/FeelingsSelection");
                });
                return "Welcome Back";
              } else {
                print("If not Exists exists");
                await Sharedpref().setEmail(value1.email.toString().trim());
                await Sharedpref().setUid(value1.id.toString());
                await Sharedpref().setUsername(value1.displayName.toString());
                await Sharedpref().setPass(" ");
                // if not exists

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(width: borderWidth, color: borderColor),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    content: Text(
                      "Welcome",
                      style: TextStyle(color: Colors.black),
                    )));


                services.writeToDatabase(
                    Uid: await Sharedpref().getUid(),
                    username: await Sharedpref().getUsername(),
                    Email: await Sharedpref().getEmail(),
                    Password: " ",
                    Feeling: await Sharedpref().getFeelings(),
                    context: context,
                    UserHabits: {});




                Future.delayed(Duration(milliseconds: 1500)).then((value) {
                  Navigator.of(context).popAndPushNamed("/AvatarScreen");

                });

                return "Welcome";
              }
            });
          }
        }).catchError((e) {
          // error are coming fronm here
          print(e);
          String errorMessage = _extractErrorMessage(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                // side: BorderSide(width: borderWidth, color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              content: Text(
                errorMessage,
                style: TextStyle(color: Colors.black),
              )));
        });
      });
    });
  }

  Future signout() async {
    try {
      print("logout clicked");
      await Sharedpref().setUsername("User");
      await Sharedpref().setDetails(false);
      await Sharedpref().setEmail("");
      await Sharedpref().setUid("");
      await Sharedpref().setPass("");
      await Sharedpref().setFeelings("");
      await  Sharedpref().setGuest(true);
        Sharedpref().saveData({});
      return await _auth.signOut(); //signout method of Firebase Auth
    } catch (e) {
      print(e.toString());
    }
  }

  void resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              // side: BorderSide(width: borderWidth, color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            content: Text(
              "Email sent to the mentioned Id",
              style: TextStyle(color: Colors.black),
            )));

      });
      // Reset email sent successfully
    } catch (e) {
      String errorMessage = _extractErrorMessage(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            // side: BorderSide(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.black),
          )));
      // Handle error
    }
  }

}

String _extractErrorMessage(String errorString) {
  // Regular expression pattern to match the relevant part of the error message
  RegExp regExp = RegExp(r'\[.*?\] (.*)');
  Match? match = regExp.firstMatch(errorString);

  // If a match is found, return the relevant part of the error message, else return the original error message
  return match != null ? match.group(1)! : errorString;
}
