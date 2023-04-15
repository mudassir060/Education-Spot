import 'package:flutter/material.dart';

snackBar(context, e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:  Text(e),
    // action: SnackBarAction(
    //   label: 'Undo',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  ));
}
