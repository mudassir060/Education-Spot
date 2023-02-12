import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Screens/Profile/educationUpdate.dart';
import 'package:education_spot/Screens/Profile/skillUpdate.dart';
import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constants/images.dart';

class profileScreen extends StatefulWidget {
  final Map UserData;

  const profileScreen({Key? key, required this.UserData}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  var Imgs = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOfULawGx7OIMmrO9F2jShe9MqvLgR5-RyUQ&usqp=CAU",
    "https://www.unigreet.com/wp-content/uploads/2021/10/Cute-baby-dp-877x1024.jpg",
    "https://www.unigreet.com/wp-content/uploads/2021/10/Baby-boy-pic-1011x1024.jpg",
    "https://www.imagediamond.com/blog/wp-content/uploads/2019/07/Girls-whatsapp-Dp-120.jpg"
  ];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var Skills = widget.UserData["Skills"];
    var education = widget.UserData["Education"];
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // // // // // // // // // // // Top Bar // // // // // // // // //
              const myAppBar(titel: "My Profile", linewidth: 130),
              // // // // // // // // // // // About // // // // // // // // //
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: vwidth - 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.UserData["username"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.UserData["email"],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Ph.No: ${widget.UserData["PhoneNo"]}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                              "Hello. I'm ${widget.UserData["username"]} Welcome to my profile")
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage(Profile),
                          ),
                        ),
                        Positioned(
                            bottom: 3,
                            right: 3,
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera_alt)))),
                      ],
                    )
                  ],
                ),
              ),
              // // // // // // // // // // // Skill // // // // // // // // //
              h1("Skills", context, widget.UserData),

              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Skills.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            icon: Icons.delete,
                            onPressed: (BuildContext context) async {
                              setState(() {
                                Skills.removeAt(index);
                              });
                               await firestore
                                    .collection("users")
                                    .doc(widget.UserData["UID"])
                                    .update({
                                  "Skills": Skills,
                                });
                            },
                          ),
                        ],
                      ),
                      child: Row(
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
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  }),
              // // // // // // // // // // // Education // // // // // // // // //

              h1("Education", context, widget.UserData),
              ListView.builder(
                  shrinkWrap: true,
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
              mySpacer(10.0, 0.0),
              // // // // // // // // // // // profile History // // // // // // // // //
              const Padding(
                padding: EdgeInsets.only(left: 18.0, bottom: 10.0),
                child: Text(
                  "Profile History",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget h1(title, context, UserData) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            height: 20,
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  if ("Skills" == title) {
                    skillUpdate(context, UserData);
                  } else {
                    educationUpdate(context, UserData);
                  }
                },
                child: Text("Add $title")))
      ],
    ),
  );
}
