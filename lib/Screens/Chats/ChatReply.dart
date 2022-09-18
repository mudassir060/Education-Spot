
import 'package:flutter/material.dart';

Widget ChatReply(textcontroler, hint, fun) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        padding: const EdgeInsets.only(left: 15.0),
        child: const TextField(
          // controller: textcontroler,
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
              hintText: "Type something...",
              hintStyle: TextStyle(color: Colors.grey,fontSize: 20,),
              border: InputBorder.none),
        ),
      ),
      Container(
          width: 90,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Center(
            child: const Text(
              "Reply",
              style: TextStyle(
                color: Colors.grey, fontSize: 20, ),
            ),
          )),
    ],
  );
}
