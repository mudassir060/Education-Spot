import 'dart:io';

import 'package:education_spot/Screens/CV/CV_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CV_2.dart';
import 'CV_3.dart';
import 'CV_4.dart';

Widget cvCard(context, data, img, cv) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Image.asset(img),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              child: IconButton(
                onPressed: () async {
                  if (data["username"] != null &&
                      data["web"] != null &&
                      data["address"] != null &&
                      data["PhoneNo"] != null &&
                      data["job"] != null &&
                      data["about_me"] != null &&
                      data["Skills"] != null &&
                      data["experiences"] != null &&
                      data["Education"] != null &&
                      data["Language"] != null &&
                      data["Hobbies"] != null) {
                    try {
                      final directory = await getExternalStorageDirectory();
                      final file = File("${directory?.path}/CV.pdf");

                      if (await Permission.storage.request().isGranted) {
                        if (cv == 1) {
                          await file.writeAsBytes(await CV_1(data));
                        } else if (cv == 2) {
                          await file.writeAsBytes(await CV_2(data));
                        } else if (cv == 3) {
                          await file.writeAsBytes(await CV_3(data));
                        } else if (cv == 4) {
                          await file.writeAsBytes(await cV_4(data));
                        } else {
                          await file.writeAsBytes(await CV_1(data));
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: Text("CV View"),
                                backgroundColor: Colors.lightBlue,
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      Share.shareXFiles(
                                          [XFile("${directory?.path}/CV.pdf")]);
                                    },
                                    icon: const Icon(Icons.share),
                                  ),
                                ],
                              ),
                              body: PDFView(
                                filePath: "${directory?.path}/CV.pdf",
                              ),
                            ),
                          ),
                        );
                      } else {
                        print(
                            "// Handle the case if the user doesn't grant permission");
                      }
                    } catch (e) {
                      print("Error: $e");
                    }
                  } else {
                    print("Please complete your profile first.");
                  }
                },
                icon: Icon(Icons.arrow_downward),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
