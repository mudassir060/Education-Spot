import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../Widgets/smallButton.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class sholarshipCard extends StatelessWidget {
  final String img;
  final String titel;
  final String subTitel;
  final String type;
  final String date;
  final String dagre;

  const sholarshipCard({
    Key? key,
    required this.img,
    required this.titel,
    required this.subTitel,
    required this.type,
    required this.date,
    required this.dagre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondery2Color,
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              mySpacer(0.0, 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titel,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    subTitel,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          mySpacer(10.0, 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              smallButton(type, () {}, false),
              smallButton(date, () {}, false),
              smallButton(dagre, () {}, false),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Details",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



