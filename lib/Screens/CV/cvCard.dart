import 'dart:io';

import 'package:flutter/material.dart';
import '../../constants/images.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Widget cvCard(data, img) {
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
                    final pdf = pw.Document();

                    pdf.addPage(pw.Page(
                        pageFormat: PdfPageFormat.a4,
                        build: (pw.Context context) {
                          return pw.Center(
                            child: pw.Text("Hello World"),
                          ); // Center
                        }));
  final output = await getTemporaryDirectory();
  final file = File("${output.path}/example.pdf");
                    final file = File("CV");
                    await file.writeAsBytes(await pdf.save());
                  },
                  icon: Icon(Icons.arrow_downward)),
            )),
      ],
    ),
  ));
}
