import 'package:education_spot/Widgets/myAppBar.dart';
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
  var education = [
    {"name": "Matric", "start": "2016", "end": "2019"},
    {"name": "BSCS", "start": "2019", "end": "2023"},
  ];
  var Imgs = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOfULawGx7OIMmrO9F2jShe9MqvLgR5-RyUQ&usqp=CAU",
    "https://www.unigreet.com/wp-content/uploads/2021/10/Cute-baby-dp-877x1024.jpg",
    "https://www.unigreet.com/wp-content/uploads/2021/10/Baby-boy-pic-1011x1024.jpg",
    "https://www.imagediamond.com/blog/wp-content/uploads/2019/07/Girls-whatsapp-Dp-120.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    var data = Imgs.length;
    var quot = (data / 3).floor();
    var rem = data.remainder(3);
    if (rem >= 1) {
      data = quot + 1;
    } else {
      data = quot;
    }
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // // // // // // // // // // // Top Bar // // // // // // // // //
              myAppBar(titel: "My Profile", linewidth: 130),
              // // // // // // // // // // // About // // // // // // // // //
              Padding(
                padding: const EdgeInsets.only(top: 18.0,left: 18.0,right: 18.0,),
                child: Row(
                  children: [
                    SizedBox(
                      width: vwidth - 180,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Mudassir Mukhtar",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: AssetImage(Profile),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                            right: 3,
                            child: CircleAvatar(radius: 20,backgroundColor: Colors.white, child: IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)))),
                      ],
                    )
                  ],
                ),
              ),
              // // // // // // // // // // // Skill // // // // // // // // //
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "Skills",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, ))
                  ],
                ),
              ),

              Container(
                height: 23 * Skills.length.toDouble(),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Skills.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 38.0, right: 8.0),
                            child: Icon(
                              Icons.star,
                              size: 18,
                            ),
                          ),
                          Text(
                            Skills[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      );
                    }),
              ),
              // // // // // // // // // // // Skill // // // // // // // // //
               Padding(
                padding: EdgeInsets.only(left: 18.0, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "Education",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, ))
                  ],
                ),
              ),

              Container(
                height: 30 * education.length.toDouble(),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: education.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 38.0, right: 8.0),
                            child: Icon(
                              Icons.star,
                              size: 18,
                            ),
                          ),
                          Text(
                            "${education[index]["name"]}  (${education[index]["start"]} - ${education[index]["end"]})",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      );
                    }),
              ),
              // // // // // // // // // // // profile History // // // // // // // // //
              Container(
                height: 155 * data.toDouble(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: GridView.count(
                    primary: false,
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
        ),
      ),
    );
  }
}
