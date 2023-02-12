import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

Widget ChatReply(textcontroler, hint, fun) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 210,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 15.0, top: 15),
        child: TextField(
          controller: textcontroler,
          style: const TextStyle(color: Colors.grey),
          decoration: const InputDecoration(
              hintText: "Type something...",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              border: InputBorder.none),
        ),
      ),
      // InkWell(
      //   onTap: fun,
      //   child: Container(
      //       width: 70,
      //       height: 40,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         color: Colors.grey.withOpacity(0.1),
      //       ),
      //       child: const Center(
      //         child:  Text(
      //           "Reply",
      //           style: TextStyle(
      //             color: Colors.grey, fontSize: 20, ),
      //         ),
      //       )),
      // ),
      ElevatedButton(
        onPressed: fun,
        child: const Text(
          "Reply",
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ],
  );
}
