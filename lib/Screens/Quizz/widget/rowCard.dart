import 'package:flutter/material.dart';

import '../Data.dart';
import '../QuizQuestion.dart';
import '../QuizStart.dart';

class rowCard extends StatelessWidget {
  final String img;
  final String title;
  final List data;

  const rowCard({Key? key, required this.img, required this.title, required question, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 8),
      child: Card(
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(30),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.5),
        //       spreadRadius: 5,
        //       blurRadius: 7,
        //       offset: const Offset(0, 3), // changes position of shadow
        //     ),
        //   ],
        //   // color: primaryColor,
        // ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizStart(data: data,)),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
