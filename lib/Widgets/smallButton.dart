import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

Widget smallButton(titel, fun, color) {
  return InkWell(
    onTap: () {
      fun;
    },
    child: Container(
      // width: 80,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color? Colors.white.withOpacity(0.5):primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0, top: 8),
        child: Center(
            child: Text(
              titel,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
      ),
    ),
  );
}