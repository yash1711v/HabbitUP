import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';

import 'login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1F1F1F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              String LoginIg="assets/ImagesY/LoginIg.svg";
              String forgotIg="assets/ImagesY/ForgotScreenIg.svg";
              if (state is WrongForgotEmailState) {
                LoginIg=forgotIg;
              }
              return SvgPicture.asset(
                LoginIg,
                width: MediaQuery.of(context1).size.width,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              String Error = "";
              bool forgotanimation = false;
              if (state is WrongEmailState) {
                Error = state.error;
              }
              if (state is WrongForgotEmailState) {
                forgotanimation = state.animation;
                if (state.error.isNotEmpty) {
                  Error = state.error;
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return TextField(
                        style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(color: Colors.white)),
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFF292929),
                          hintText: "Enter email ID here",
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Colors.transparent),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintStyle: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Colors.transparent),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: forgotanimation
                            ? (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    ForgotEmailTextchangeEvent(
                                        email: value.trim()));
                              }
                            : (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    loginEmailTextchangeEvent(
                                        email: value.trim()));
                                BlocProvider.of<LoginBloc>(context).add(
                                    ActiveLoginButtonEvent(
                                        email: emailController.text,
                                        Pass: passwordController.text));
                              },
                      );
                    },
                  ),
                  Visibility(
                    visible: Error.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 5),
                      child: Text(
                        Error,
                        style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.16,
                        )),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              bool forgotanimation = false;
              bool visible = true;
              if (state is WrongForgotEmailState) {
                forgotanimation = true;
                visible = !state.animation;
              }
              return Visibility(
                visible: visible,
                child: AnimatedOpacity(
                  opacity: forgotanimation ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 25, top: 15, left: 25),
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        String Error = "";
                        if (state is WrongPassState) {
                          Error = state.error;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: GoogleFonts.dmSans(
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: const Color(0xFF292929),
                                hintStyle: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.5))),
                                hintText: "Enter Password here",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.transparent),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.transparent),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    loginPassTextchangeEvent(
                                        Pass: value.trim()));
                                BlocProvider.of<LoginBloc>(context).add(
                                    ActiveLoginButtonEvent(
                                        email: emailController.text,
                                        Pass: passwordController.text));
                              },
                            ),
                            Visibility(
                              visible: Error.isNotEmpty,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 5),
                                child: Text(
                                  Error,
                                  style: GoogleFonts.dmSans(
                                      textStyle: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0.06,
                                    letterSpacing: 0.16,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              bool forgotState = false;
              bool visible = true;
              if (state is WrongForgotEmailState) {
                forgotState = state.animation;
                visible = !state.animation;
              }
              return Visibility(
                visible: forgotState == false ? true : false,
                child: AnimatedOpacity(
                  opacity: forgotState ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: forgotState
                                ? () {}
                                : () {
                                    BlocProvider.of<LoginBloc>(context1)
                                        .add(ForgoButtonCalled());
                                  },
                            child: Text(
                              forgotState
                                  ? 'Remember Password'
                                  : "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 10,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                                letterSpacing: 0.10,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              bool forgotState = false;
              bool visible = true;
              if (state is WrongForgotEmailState) {
                forgotState = state.animation;
                visible = !state.animation;
              }
              return Visibility(
                visible: visible,
                child: AnimatedOpacity(
                  opacity: forgotState ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "OR",
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      )),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              bool forgotState = false;
              bool visible = true;
              if (state is WrongForgotEmailState) {
                forgotState = state.animation;
                visible = !state.animation;
              }
              return Visibility(
                visible: visible,
                child: AnimatedOpacity(
                  opacity: forgotState ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 340,
                      height: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xED2A2A2A),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context1)
                                .add(GooggleLoginButton(context: context1));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/ImagesY/GoogleLogo.svg"),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text('Log in with google',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              bool forgotState = false;
              bool visible = true;
              bool Active = false;
              if (state is WrongForgotEmailState) {
                forgotState = state.animation;
                visible = !state.animation;
                Active = true;
              }
              if (state is ActiveLoginButtom) {
                Active = state.Active;
              }
              return AnimatedPadding(
                padding:
                    EdgeInsets.only(top: forgotState ? 25 : 100, bottom: 25),
                duration: Duration(milliseconds: 605),
                child: Column(
                  children: [
                    SizedBox(
                      width: 327,
                      height: 61,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: Active == true
                                ? const Color(0xFFFEF656)
                                : const Color(0xFFFEF656).withOpacity(0.6),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: Active == true
                              ? () {
                                  if (visible) {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        loginButtonClickedEvent(
                                            email: emailController.text.trim(),
                                            Pass:
                                                passwordController.text.trim(),
                                            context: context1));
                                  } else {
                                    BlocProvider.of<LoginBloc>(context1).add(
                                        ForgoButtonPressed(
                                            context: context1,
                                            email:
                                                emailController.text.trim()));
                                  }
                                }
                              : () {},
                          child: Text(
                            visible == false ? 'Send Link' : 'Log in',
                            style: GoogleFonts.dmSans(
                                textStyle: GoogleFonts.dmSans(
                              textStyle: const TextStyle(
                                color: Color(0xFF1F1F1F),
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    Visibility(
                      visible: visible,
                      child: AnimatedOpacity(
                        opacity: forgotState ? 0 : 1,
                        duration: Duration(milliseconds: 600),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not registered?",
                              style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
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
                                Navigator.of(context1)
                                    .pushReplacementNamed("/SignupScreen");
                              },
                              child: Text(
                                "Create Account",
                                style: GoogleFonts.dmSans(
                                    textStyle: const TextStyle(
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
                      ),
                    ),
                    AnimatedPadding(
                      padding: EdgeInsets.zero,
                      duration: Duration(milliseconds: 605),
                      child: TextButton(
                          onPressed: forgotState
                              ? () {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(RememberEvent());
                                }
                              : () {
                                  Sharedpref().setGuest(true);
                                  Sharedpref().setUsername("User");
                                  Navigator.of(context1)
                                      .pushReplacementNamed("/AvatarScreen");
                                },
                          child: Text(
                            forgotState ? 'Go back' : 'Skip',
                            style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: 0.10,
                            )),
                          )),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
