import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/images.dart';
import '../constants/style.dart';
import 'mySpacer.dart';

class myAppBar extends StatelessWidget {
  final String titel;
  final double linewidth;
  const myAppBar({Key? key, required this.titel, required this.linewidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(backCurve)),
        mySpacer(0.0, 0.0),
        Column(
          children: [
             Text(
              titel,
              style:
              const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            mySpacer(10.0, 0.0),
            Container(
              width: linewidth,
              height: 2,
              color: primaryColor,
            )
          ],
        ),
        mySpacer(0.0, 0.0),
        mySpacer(0.0, 0.0),

      ],
    );
  }
}
