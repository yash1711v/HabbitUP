import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../Bloc/general_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (context, state) {

       Future.delayed(Duration(seconds: 2),  (){
         BlocProvider.of<GeneralBloc>(context).add(checkisAuthenticated(context));

       });
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(46, 46, 46, 1),
                Color.fromRGBO(35, 35, 35, 1),
                Color.fromRGBO(0, 0, 0, 1),
              ],
            )),
            child:
                Lottie.asset('assets/LOGO@.json', height: 700, repeat: false),
          ),
        );
      },
    );
  }
}
