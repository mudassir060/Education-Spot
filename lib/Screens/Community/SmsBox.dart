import 'package:flutter/material.dart';

smsBox(context){

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          title: Text('Welcome'),
          content: Text('GeeksforGeeks'),
          actions: [

          ],
        ),
      );
    },
  );
}