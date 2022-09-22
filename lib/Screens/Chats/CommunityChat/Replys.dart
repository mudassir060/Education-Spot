import 'package:flutter/cupertino.dart';

import '../../../constants/style.dart';

Widget Replys(name, reply) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            "$name:",
            style: TextStyle(
                fontSize: 16,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Text(
        "         $reply",
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    ],
  );
}
