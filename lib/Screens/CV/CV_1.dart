import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

pw.Center CV_1(font) {
  return pw.Center(
    child: pw.Row(
      children: [
        pw.Column(
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Column(
                children: [
                  pw.Text("${UserData["username"]}"),
                  pw.Text("${UserData["job"]}"),
                ],
              ),
            ),
            pw.Text("Contact"),
            pw.Text("${UserData["PhoneNo"]}"),
            pw.Text("${UserData["email"]}"),
            pw.Text("${UserData["web"]}"),
            // pw.ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (BuildContext context, int index) {
            //     return pw.Container();
            //   },
            // ),
          ],
        ),
      ],
    ),
  );
}

var UserData = {
  "UID": "gJMuRU3noAOty24E1ZFglLOPiun1",
  "password": "qwerty",
  "Education": [
    {"start": 2014, "name": "asfs", "end": 2023}
  ],
  "PhoneNo": "03046303385",
  "Skills": ["Flutter & Dart", "React & React Native"],
  "JoinDate": "Thu 1 Dec",
  "email": "abc@gmail.com",
  "username": "Mudassir Mukhtar"
};
Widget CVW_1() {
  return Scaffold(
    body: Row(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue.shade100,
              ),
              child: Column(
                children: [
                  Text("${UserData["username"]}"),
                  Text("${UserData["job"]}"),
                ],
              ),
            ),
            Text("Contact"),
            Text("${UserData["PhoneNo"]}"),
            Text("${UserData["email"]}"),
            Text("${UserData["web"]}"),
            Text("Skills"),
            ListView.builder(
              itemCount: 10, // The number of items to build
              itemBuilder: (BuildContext context, int index) {
                // The indexed Builder function
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ],
        ),
      ],
    ),
  );
}
