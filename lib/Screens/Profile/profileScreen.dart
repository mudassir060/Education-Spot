import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Screens/Profile/educationUpdate.dart';
import 'package:education_spot/Screens/Profile/skillUpdate.dart';
import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import '../../Widgets/snackBar.dart';
import '../../constants/images.dart';

class profileScreen extends StatefulWidget {
  final Map UserData;

  const profileScreen({Key? key, required this.UserData}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool imageLooding = false;
  var progressshow = 0.0;

  late final XFile? image;
  pickImage() async {
    setState(() {
      imageLooding = true;
    });
    image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 45);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image!.path));
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      setState(() {
        progressshow = progress;
      });
    });
    uploadTask.whenComplete(() async {
      var url = await ref.getDownloadURL();

      await firestore.collection("users").doc(widget.UserData["UID"]).update({
        "profile": url,
      });
      setState(() {
        widget.UserData["profile"] = url;
        imageLooding = false;
      });
    }).catchError((onError) {
      setState(() {
        imageLooding = false;
      });
      snackBar(context, onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var Skills = widget.UserData["Skills"];
    var education = widget.UserData["Education"];
    var experiences = widget.UserData["experiences"];
    var Language = widget.UserData["Language"];
    var Hobbies = widget.UserData["Hobbies"];
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        widget.UserData["username"] != null
                            ? Text(
                                widget.UserData["username"],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            : Container(),
                        widget.UserData["email"] != null
                            ? Text(
                                widget.UserData["email"],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : Container(),
                        widget.UserData["PhoneNo"] != null
                            ? Text(
                                "Ph.No: ${widget.UserData["PhoneNo"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : Container(),
                        widget.UserData["about_me"] != null
                            ? Text("${widget.UserData["about_me"]}")
                            : Container(),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        child: widget.UserData["profile"] == null
                            ? CircleAvatar(
                                radius: 55,
                                backgroundImage: AssetImage(Profile),
                                child: imageLooding == true
                                    ? CircularProgressIndicator(
                                        value: progressshow / 100,
                                        backgroundColor: Colors.purple,
                                        semanticsValue: progressshow.toString(),
                                        semanticsLabel: progressshow.toString(),
                                      )
                                    : Container(),
                              )
                            : CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                    NetworkImage(widget.UserData["profile"])),
                      ),
                      Positioned(
                          bottom: 3,
                          right: 3,
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {
                                    pickImage();
                                  },
                                  icon: const Icon(Icons.camera_alt)))),
                    ],
                  )
                ],
              ),
            ),
            // // // // // // // // // // // Skill // // // // // // // // //
            // h1("Skills", context, widget.UserData),
            h1("Skills"),

            widget.UserData["Skills"] != null
                ? ListView.builder(
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
                                foregroundColor: Colors.red,
                                onPressed: (BuildContext context) async {
                                  setState(() {
                                    widget.UserData["Skills"].removeAt(index);
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(widget.UserData["UID"])
                                      .update({
                                    "Skills": widget.UserData["Skills"],
                                  });
                                },
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 38.0, right: 8.0),
                                child: Icon(
                                  Icons.star,
                                  size: 18,
                                ),
                              ),
                              Text(
                                Skills[index]["name"],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ));
                    })
                : Text("No Skill"),
            // // // // // // // // // // // Education // // // // // // // // //

            h1("Education"),
            widget.UserData["Education"] != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: education.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              icon: Icons.delete,
                              foregroundColor: Colors.red,
                              onPressed: (BuildContext context) async {
                                setState(() {
                                  education.removeAt(index);
                                });
                                await firestore
                                    .collection("users")
                                    .doc(widget.UserData["UID"])
                                    .update({
                                  "Education": education,
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
                              "${education[index]["name"]}  (${education[index]["startDate"]} - ${education[index]["endDate"]})",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    })
                : Text("No Education"),
            mySpacer(10.0, 0.0),

            // // // // // // // // // // // Education // // // // // // // // //
            h1("Experiences"),
            widget.UserData["Experiences"] != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: experiences.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              icon: Icons.delete,
                              foregroundColor: Colors.red,
                              onPressed: (BuildContext context) async {
                                setState(() {
                                  experiences.removeAt(index);
                                });
                                await firestore
                                    .collection("users")
                                    .doc(widget.UserData["UID"])
                                    .update({
                                  "experiences": experiences,
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
                              "${experiences[index]["name"]}  (${experiences[index]["startDate"]} - ${experiences[index]["endDate"]})",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    })
                : Text("No Experiences"),
            mySpacer(10.0, 0.0),
            // // // // // // // // // // // Skill // // // // // // // // //
            // h1("Skills", context, widget.UserData),
            h1("Hobbies"),

            widget.UserData["Hobbies"] != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Hobbies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                icon: Icons.delete,
                                foregroundColor: Colors.red,
                                onPressed: (BuildContext context) async {
                                  setState(() {
                                    widget.UserData["Hobbies"].removeAt(index);
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(widget.UserData["UID"])
                                      .update({
                                    "Hobbies": widget.UserData["Hobbies"],
                                  });
                                },
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 38.0, right: 8.0),
                                child: Icon(
                                  Icons.star,
                                  size: 18,
                                ),
                              ),
                              Text(
                                Hobbies[index]["name"],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ));
                    })
                : Text("No Hobbies"),

            mySpacer(10.0, 0.0),
            // // // // // // // // // // // Skill // // // // // // // // //
            h1("Language"),
            widget.UserData["Language"] != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Language.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                icon: Icons.delete,
                                foregroundColor: Colors.red,
                                onPressed: (BuildContext context) async {
                                  setState(() {
                                    widget.UserData["Language"].removeAt(index);
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(widget.UserData["UID"])
                                      .update({
                                    "Language": widget.UserData["Language"],
                                  });
                                },
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 38.0, right: 8.0),
                                child: Icon(
                                  Icons.star,
                                  size: 18,
                                ),
                              ),
                              Text(
                                Language[index]["name"],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ));
                    })
                : Text("No Language"),

            mySpacer(10.0, 0.0),

            // // // // // // // // // // // profile History // // // // // // // // //
            // const Padding(
            //   padding: EdgeInsets.only(left: 18.0, bottom: 10.0),
            //   child: Text(
            //     "Profile History",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            //   child: GridView.count(
            //     shrinkWrap: true,
            //     primary: false,
            //     crossAxisCount: 3,
            //     crossAxisSpacing: 4.0,
            //     mainAxisSpacing: 8.0,
            //     children: List.generate(Imgs.length, (index) {
            //       return Container(
            //         // alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           image: DecorationImage(
            //             image: NetworkImage(Imgs[index]),
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

// Widget h1(title, context, UserData) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//             height: 20,
//             width: 120,
//             child: ElevatedButton(
//                 onPressed: () {
//                   if ("Skills" == title) {
//                     skillUpdate(context, UserData);
//                   } else {
//                     educationUpdate(context, UserData);
//                   }
//                 },
//                 child: Text("Add $title")))
//       ],
//     ),
//   );
// }

Widget h1(title) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
    ),
  );
}
