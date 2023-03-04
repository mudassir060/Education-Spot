import 'dart:io';

import 'package:education_spot/Screens/CV/CV_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import '../../constants/images.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

Widget cvCard(context,data, img) {
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
                    try {
                      // final pdf = pw.Document();
                      //   final font = await PdfGoogleFonts.nunitoExtraLight();

                      // pdf.addPage(pw.Page(
                      //     pageFormat: PdfPageFormat.a4,
                      //     build: (pw.Context context) {
                      //       return CV_1(font); // Center
                      //     }));

                      final directory = await getExternalStorageDirectory();
                      final file = File("${directory?.path}/CV.pdf");

                      if (await Permission.storage.request().isGranted) {
                        await file.writeAsBytes(await CV_1( data));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PDFViewerScaffold(appBar: AppBar(), path: "${directory?.path}/CV.pdf")));
                      } else {
                        print(
                            "// Handle the case if the user doesn't grant permission");
                      }
                    } catch (e) {
                      print("=====<$e");
                    }
                  },
                  icon: Icon(Icons.arrow_downward)),
            )),
      ],
    ),
  ));
}