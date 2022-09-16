import 'package:flutter/material.dart';

import '../../../Widgets/mySpacer.dart';
import '../../../constants/style.dart';

class backDesgin extends StatelessWidget {
  const backDesgin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        mySpacer(25.0, 0.0),
        const Align(
            alignment: Alignment(-1.5, -0.40),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: green,
            )),
        mySpacer(30.0, 0.0),
        const Align(
            alignment: Alignment(1.5, 0.40),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: primaryColor,
            )),
      ],
    );
  }
}
