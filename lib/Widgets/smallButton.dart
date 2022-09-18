import 'package:flutter/material.dart';

Widget smallButton(titel, fun) {
  return InkWell(
    onTap: () {
      fun;
    },
    child: Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Center(
          child: Text(
            titel,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    ),
  );
}