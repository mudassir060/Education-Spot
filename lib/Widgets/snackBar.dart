import 'package:flutter/material.dart';

snackBar(context, e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(e),
    duration: Duration(seconds: 5),
    // action: SnackBarAction(
    //   label: 'Undo',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  ));
}
