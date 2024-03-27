import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final TextEditingController content;
  final VoidCallback onClosePressed;

  CustomDialogBox({
    required this.title,
    required this.content,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.subtitle1?.color,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: content,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).textTheme.subtitle1?.color),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabled: true ,
                hintText: content.text,
              )
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: onClosePressed,
              child: Text('ok'),
            ),
          ],
        ),
      ),
    );
  }
}