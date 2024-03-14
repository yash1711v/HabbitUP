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
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:
              Lottie.asset('assets/Animations/SplashScreen.json', fit: BoxFit.fill, repeat: false),
        );
      },
    );
  }
}
