import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Screens/Chats/CommunityChat/QuestionCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../Widgets/mySpacer.dart';
import '../../../constants/images.dart';
import '../../../constants/style.dart';
import '../../Community/SmsBox.dart';

class communityChatScreen extends StatefulWidget {
  final Map UserData;
  final String name;

  const communityChatScreen(
      {Key? key, required this.name, required this.UserData})
      : super(key: key);

  @override
  State<communityChatScreen> createState() => _communityChatScreenState();
}

class _communityChatScreenState extends State<communityChatScreen> {
  TextEditingController replycontroller = TextEditingController();
  final Stream<QuerySnapshot> _itemStream = FirebaseFirestore.instance
      .collection('Community')
      // .orderBy('JoinDate', descending: true)
      //     .where('community', isEqualTo: widget.name)
      // .limitToLast(2)l
      .snapshots();

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: seconderyColor,
          mini: true,
          onPressed: () {
            smsBox(context, widget.UserData, widget.name);
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // // // // // // // // // // // Top Bar // // // // // // // // //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(backCurve)),
                  mySpacer(0.0, 0.0),
                  Column(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
              // // // // // // // // // // // Chats // // // // // // // // //
              // QuestionCard(
              //     vwidth,
              //     "Azeem",
              //     "What topics do you want to discuss?",
              //     chatdata,
              //     replycontroller, () {
              //     chatdata.add({
              //       "name": "Mudassir",
              //       "reply": replycontroller.text,
              //     });
              // }),
              StreamBuilder<QuerySnapshot>(
                stream: _itemStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      children: const [
                        Text('Something went wrong'),
                      ],
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data?.size == 0) {
                    return Center(child: const Text("No data found"));
                  }
                  return ListView(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        if (widget.name != data["community"]) {
                          return Container();
                        }
                        return QuestionCard(
                            vwidth,
                            data["username"],
                            data["question"],
                            data["answers"],
                            replycontroller, () async {
                          FirebaseFirestore firestore =
                              FirebaseFirestore.instance;
                          DateTime now = DateTime.now();
                          if (replycontroller.text != null) {
                            data["answers"].add({
                              "name": widget.UserData["username"],
                              "reply": replycontroller.text,
                            });
                            String formattedDate =
                                DateFormat('EEE d MMM').format(now);
                            await firestore
                                .collection("Community")
                                .doc(data["key"])
                                .update({
                              "answers": data["answers"],
                              "JoinDate": formattedDate,
                            });
                          } else {}
                        });
                      }).toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
