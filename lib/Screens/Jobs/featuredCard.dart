import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class featuredCard extends StatelessWidget {
  final String img;
  final String titel;
  final String subTitel;
  final String location;
  final String sallery;

  const featuredCard(
      {Key? key,
      required this.img,
      required this.titel,
      required this.subTitel,
      required this.location,
      required this.sallery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(top: 15.0, bottom: 10.0),
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
              smallbutton("Design", () {}),
              smallbutton("Full-Time", () {}),
              smallbutton("Product", () {}),
            ],
          ),
          mySpacer(10.0, 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Text(
                "$sallery \$",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// // // // // // // // // // // smallbutton // // // // // // // // //

Widget smallbutton(titel, fun) {
  return InkWell(
    onTap: () {
      fun;
    },
    child: Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Center(
          child: Text(
        titel,
        style: TextStyle(color: Colors.white, fontSize: 16),
      )),
    ),
  );
}
