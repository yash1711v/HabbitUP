import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:fluttermoji/fluttermojiThemeData.dart';

Future EditAvator(BuildContext context){
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FluttermojiCustomizer(
          scaffoldWidth:
          MediaQuery.of(context).size.width,
          scaffoldHeight: MediaQuery.of(context)
              .size
              .height -
              400,
          autosave: true,
          theme: FluttermojiThemeData(
              primaryBgColor: Colors.white,
              labelTextStyle: const TextStyle(
                  color: Colors.black),
              tileMargin: EdgeInsets.zero,
              tilePadding: EdgeInsets.zero,
              secondaryBgColor: Colors.white),
        );
      });
}
