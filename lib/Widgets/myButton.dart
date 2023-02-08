// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/style.dart';

Widget myButton(
    {required double width,
    required Null Function() function,
    required String name,
    required bool loading}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(seconderyColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
    onPressed: function,
    child: SizedBox(
      width: width - 100,
      height: 50,
      child: Center(
          child: loading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
    ),
  );
}
