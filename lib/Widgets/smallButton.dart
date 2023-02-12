import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

Widget smallButton(titel, fun, color) {
  return  Padding(
    padding: const EdgeInsets.only(left: 5,top: 5, right: 5),
    child: SizedBox( height: 30, child: ElevatedButton(onPressed: fun, child: Text(titel))),
  );
}