import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("MainScreen");
    return Scaffold(
      body: Center(child: Text("hello",style: TextStyle(color: Colors.black),)),
    );
  }
}
