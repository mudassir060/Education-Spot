import 'package:flutter/material.dart';
import '../../constants/';
Widget cvCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
          Image.asset(cv_1),
          ElevatedButton(onPressed: (){}, child: const Text("Use Templete")),
            ],
          ),
        )),
  );
}
