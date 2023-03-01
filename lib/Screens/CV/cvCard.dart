import 'package:flutter/material.dart';
import '../../constants/images.dart';
Widget cvCard() {
  return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
        Image.asset(cv_1),
                Positioned(top: 40, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text("Use Templete")),
                    SizedBox()
                  ],
                )),

          ],
        ),
      ));
}
