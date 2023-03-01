import 'package:flutter/material.dart';
import '../../constants/images.dart';

Widget cvCard(data, img) {
  return Card(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Image.asset(img),
        Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_downward)),
            )),
      ],
    ),
  ));
}
