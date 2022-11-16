import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class notificationScreen extends StatefulWidget {
  const notificationScreen({Key? key}) : super(key: key);

  @override
  State<notificationScreen> createState() => _notificationScreenState();
}

class _notificationScreenState extends State<notificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          // // // // // // // // // // // Top Bar // // // // // // // // //
          Stack(
            children: [
             myAppBar(titel: "Notifications", linewidth: 150),
              Positioned(
                top: 90,
                child: Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      mySpacer(0.0, 0.0),
                      TextButton(
                        onPressed: () {},
                        child: Text("Marks all read"),
                      ),
                      mySpacer(0.0, 0.0),
                      TextButton(
                        onPressed: () {},
                        child: Text("Sort by time"),
                      ),
                      mySpacer(0.0, 0.0),

                    ],
                  ),
                ),
              )
            ],
          ),
          // // // // // // // // // // // Notifaction List // // // // // // // // //
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                      ),
                      title: const Text("Trix's airplane"),
                      subtitle: const Text('The airplane is only in Act II.'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.more_horiz),
                          Text("${3+index}m ago")
                        ],
                      ),
                      onTap: () {
                        /* react to the tile being tapped */
                      });
                }),
          ),
        ],
      )),
    );
  }
}
