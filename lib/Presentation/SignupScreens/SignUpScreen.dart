import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:HabitUp/Presentation/SignupScreens/signup_bloc.dart';

import '../../LocalStorage/SharedPref/Sharedpref.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext conText) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1F1F1F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/ImagesY/CreateAccountIg.svg",
            width: MediaQuery.of(conText).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (conText, state) {
                String error = "";
                if (state is WrongUsernameStateSignUp) {
                  error = state.error;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: GoogleFonts.dmSans(textStyle:const TextStyle(color: Colors.white)),
                      controller: usernameController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFF292929),
                        hintText: "Enter username here",
                        hintStyle: GoogleFonts.dmSans(textStyle:TextStyle(color: Colors.white.withOpacity(0.5))),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.transparent),
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.transparent),
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<SignupBloc>(conText).add(
                            SignupUserNameTextchangeEvent(
                                username: value.trim()));
                        BlocProvider.of<SignupBloc>(conText).add(
                            ActiveSignupButtonEvent(
                                email: emailController.text.trim(),
                                Pass: passwordController.text.trim(),
                                Username: usernameController.text.trim()));
                      },
                    ),
                    Visibility(
                      visible: error.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: Text(
                          error,
                          style: GoogleFonts.dmSans(textStyle:const TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),)
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (conText, state) {
                String error = "";
                if (state is WrongEmailStateSignUp) {
                  error = state.error;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: GoogleFonts.dmSans(textStyle:const TextStyle(color: Colors.white)),
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFF292929),
                        hintText: "Enter email ID here",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.transparent),
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintStyle: GoogleFonts.dmSans(textStyle:TextStyle(color: Colors.white.withOpacity(0.5))),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.transparent),
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<SignupBloc>(conText).add(
                            SignupEmailTextchangeEvent(email: value.trim()));
                        BlocProvider.of<SignupBloc>(conText).add(
                            ActiveSignupButtonEvent(
                                email: emailController.text.trim(),
                                Pass: passwordController.text.trim(),
                                Username: usernameController.text.trim()));
                      },
                    ),
                    Visibility(
                      visible: error.isNotEmpty ,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: Text(
                          error,
                          style: GoogleFonts.dmSans(textStyle:const TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),)
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (conText, state) {
                String error = "";
                if (state is WrongPassStateSignUp) {
                  error = state.error;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: GoogleFonts.dmSans(textStyle:const TextStyle(color: Colors.white)),
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFF292929),
                        hintStyle: GoogleFonts.dmSans(textStyle:TextStyle(color: Colors.white.withOpacity(0.5))),
                        hintText: "Enter password here",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.transparent),
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.transparent),
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<SignupBloc>(conText)
                            .add(SignupPassTextchangeEvent(Pass: value.trim()));
                        BlocProvider.of<SignupBloc>(conText).add(
                            ActiveSignupButtonEvent(
                                email: emailController.text.trim(),
                                Pass: passwordController.text.trim(),
                                Username: usernameController.text.trim()));
                      },
                    ),
                    Visibility(
                      visible: error.isNotEmpty ,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: Text(
                          error,
                          style:GoogleFonts.dmSans(textStyle:  const TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                            letterSpacing: 0.16,
                          ),),

                        ),
                      ),
                    ),

                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 34),
            child: Text(
              "OR",
              style: GoogleFonts.dmSans(textStyle:TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0.06,
                letterSpacing: 0.16,
              ),)
            ),
          ),
          SizedBox(
            width: 340,
            height: 65,
            child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                  const Color(0xEE2A2A2A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                onPressed: () {
                  BlocProvider.of<SignupBloc>(conText).add(GooggleSignupButton(context: conText));

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/ImagesY/GoogleLogo.svg"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Sign up with google',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(textStyle:const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),)
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 59, bottom: 15),
            child: Column(
              children: [
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    bool active=false;
                    if(state is ActiveSignupButtomSignup){
                      active=state.Active;
                    }
                    return SizedBox(
                      width: 327,
                      height: 61,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: active==true?const Color(0xFFFEF656):const Color(0xFFFEF656).withOpacity(0.6),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: active==true?() {
                            BlocProvider.of<SignupBloc>(context).add(SignupButtonClickedEvent(email: emailController.text.trim(), Pass: passwordController.text.trim(), context: context, Username: usernameController.text.trim()));
                          }:(){},
                          child: Text(
                            'Create Account',
                            style: GoogleFonts.dmSans(textStyle:const TextStyle(
                              color: Color(0xFF1F1F1F),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
                            textAlign: TextAlign.center,
                          )),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style:GoogleFonts.dmSans(textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      )),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(conText)
                            .pushReplacementNamed("/LoginScreen");
                      },
                      child: Text(
                        "Log in",
                        style: GoogleFonts.dmSans(textStyle:const TextStyle(
                          color: Color(0xFFFEF656),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.16,
                        )),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Sharedpref().setGuest(true);
                    Sharedpref().setUsername("User");
                    Navigator.of(conText).pushReplacementNamed("/AvatarScreen");
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.dmSans(textStyle:TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 15,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: 0.10,
                    )),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
