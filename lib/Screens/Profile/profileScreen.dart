import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/images.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  var Skills = ["Programming", "SEO", "Marketing"];
  var Imgs = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOfULawGx7OIMmrO9F2jShe9MqvLgR5-RyUQ&usqp=CAU",
    "https://www.unigreet.com/wp-content/uploads/2021/10/Cute-baby-dp-877x1024.jpg",
    "https://www.unigreet.com/wp-content/uploads/2021/10/Baby-boy-pic-1011x1024.jpg",
    "https://www.imagediamond.com/blog/wp-content/uploads/2019/07/Girls-whatsapp-Dp-120.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // // // // // // // // // // Top Bar // // // // // // // // //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(settingCurve),
              mySpacer(0.0, 0.0),
              Column(
                children: [
                  const Text(
                    "My Profile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  mySpacer(10.0, 0.0),
                  Container(
                    width: 200,
                    height: 2,
                    color: primaryColor,
                  )
                ],
              ),
              mySpacer(0.0, 0.0),
            ],
          ),
          // // // // // // // // // // // About // // // // // // // // //
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                SizedBox(
                  width: vwidth - 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mudassir Mukhtar",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "mudassir4@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text("Hello. I'm Mudassir Mukhtar Welcome to my profile")
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 70,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(Profile),
                  ),
                )
              ],
            ),
          ),
          // // // // // // // // // // // Skill // // // // // // // // //
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Skills",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            flex: 2,
            child: ListView.builder(
                itemCount: Skills.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0, right: 8.0),
                        child: Icon(Icons.star),
                      ),
                      Text(
                        Skills[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                }),
          ),
          // // // // // // // // // // // profile History // // // // // // // // //
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(Imgs.length, (index) {
                  return Container(
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(Imgs[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
