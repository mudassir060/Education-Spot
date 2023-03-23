import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../constants/images.dart';

const PdfColor green = PdfColor.fromInt(0xFF414443);
const PdfColor lightGreen = PdfColor.fromInt(0xFF808583);
const PdfColor black = PdfColor.fromInt(0xFF333131);
const PdfColor yellow = PdfColor.fromInt(0xB4F3B020);
const PdfColor light_black = PdfColor.fromInt(0xB41B1B1A);
const PdfColor white = PdfColor.fromInt(0xB4FAFAF3);
const sep = 150.0;

Future<Uint8List> CV_4(data) async {
  final doc = pw.Document(title: 'My Résumé', author: '${data["username"]}');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load(Profile)).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(PdfPageFormat.a4);

  doc.addPage(
    // pw.MultiPage(
    Page(
      pageTheme: pageTheme,
      build: (pw.Context context) => pw.Partitions(
        children: [
          pw.Partition(
            width: sep,
            child: pw.Column(
              children: [
                pw.Container(
                  color: black,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                            height: 150,
                            width: 400,
                            child: pw.Image(profileImage)),
                        if (data["Education"].length != null)
                          SideBar_H1(title: 'Education'),
                        pw.SizedBox(height: 10),
                        if (data["Education"].length != null)
                          pw.ListView.builder(
                            
                            itemCount: data["Education"].length,
                            itemBuilder: (context, int index) {
                              return Education_Block(
                                  eduData: data["Education"][index]);
                            },
                          ),
                        pw.SizedBox(height: 30),
                        pw.Row(
                          children: [
                            Container(height: 15, width: 30, color: yellow),
                            Container(
                              height: 15,
                              width: 120,
                              color: light_black,
                              padding:
                                  const pw.EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                'Phone:',
                                style: TextStyle(color: white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const pw.EdgeInsets.only(
                            left: 40,
                          ),
                          child: pw.Text('${data["PhoneNo"]}',
                              style: TextStyle(color: white)),
                        ),
                        SizedBox(height: 10),
                        pw.Row(
                          children: [
                            Container(height: 15, width: 30, color: yellow),
                            Container(
                              height: 15,
                              width: 120,
                              color: light_black,
                              padding:
                                  const pw.EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                'Email:',
                                style: TextStyle(color: white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const pw.EdgeInsets.only(
                            left: 40,
                          ),
                          child: pw.Text('${data["email"]}',
                              style: TextStyle(color: white)),
                        ),
                        SizedBox(height: 10),
                        pw.Row(
                          children: [
                            Container(height: 15, width: 30, color: yellow),
                            Container(
                              height: 15,
                              width: 120,
                              color: light_black,
                              padding:
                                  const pw.EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                'Website:',
                                style: TextStyle(color: white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const pw.EdgeInsets.only(
                            left: 30,
                          ),
                          child: pw.Text('${data["web"]}',
                              style: TextStyle(color: white, fontSize: 10)),
                        ),
                        SizedBox(height: 10),
                        pw.Row(
                          children: [
                            Container(height: 15, width: 30, color: yellow),
                            Container(
                              height: 15,
                              width: 120,
                              color: light_black,
                              padding:
                                  const pw.EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                'Address:',
                                style: TextStyle(color: white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const pw.EdgeInsets.only(
                            left: 30,
                          ),
                          child: pw.Text('${data["address"]}',
                              style: TextStyle(color: white, fontSize: 10)),
                        ),
                        if (data["Hobbies"].length != null)
                          SideBar_H1(title: 'Hobbies'),
                        pw.SizedBox(height: 10),
                        if (data["Hobbies"].length != null)
                          pw.ListView.builder(
                            itemCount: data["Hobbies"].length,
                            itemBuilder: (context, int index) {
                              return Hob_Block(
                                hobData: data["Hobbies"][index],
                              );
                            },
                          ),
                      ]),
                ),
              ],
            ),
          ),
          pw.Partition(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                SizedBox(height: 40),
                pw.Container(
                  height: 100,
                  width: 500,
                  color: yellow,
                  padding: const pw.EdgeInsets.only(left: 50, top: 20),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <pw.Widget>[
                      pw.Text('${data["username"]}',
                          textScaleFactor: 2,
                          style: pw.Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: pw.FontWeight.bold)),
                      pw.Padding(padding: const pw.EdgeInsets.only(top: 5)),
                      pw.Text('${data["job"]}',
                          textScaleFactor: 1.2,
                          style: pw.Theme.of(context).defaultTextStyle.copyWith(
                              fontWeight: pw.FontWeight.bold, color: black)),
                    ],
                  ),
                ),
                if (data["about_me"] != null) Page_H1(title: 'About Me'),
                pw.Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: data["about_me"] != null
                      ? pw.Text(data["about_me"])
                      : pw.Text("No data available"),
                ),
                if (data["experiences"].length != null)
                  Page_H1(title: 'Work Experience'),
                pw.Container(
                  child: data["experiences"].length != null
                      ? pw.ListView.builder(
                          itemCount: data["experiences"].length,
                          itemBuilder: (context, int index) {
                            return Exp_Block(
                                expData: data["experiences"][index]);
                          },
                        )
                      : pw.Text("No data available"),
                ),
                pw.Row(children: [
                  Column(children: [
                    if (data["Skills"].length != null)
                      Page_H1(title: 'Software Skills'),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: data["Skills"].length != null
                          ? pw.ListView.builder(
                              itemCount: data["Skills"].length,
                              itemBuilder: (context, int index) {
                                return Hob_Block(
                                    hobData: data["Skills"][index]);
                              },
                            )
                          : pw.Text("No data available"),
                    )
                  ]),
                ]),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString(cvBg_1);

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    margin: EdgeInsets.all(5),
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
  );
}

class Education_Block extends pw.StatelessWidget {
  Education_Block({
    required this.eduData,
  });

  final Map eduData;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Row(children: [
                  Container(
                    child: pw.Text(eduData["name"],
                        style: pw.Theme.of(context).defaultTextStyle.copyWith(
                            fontWeight: pw.FontWeight.bold,
                            color: white,
                            fontSize: 12)),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(eduData["uni"], style: TextStyle(color: white)),
                  //pw.Spacer(),
                ]),
                Container(
                  padding: const pw.EdgeInsets.only(
                    left: 14,
                  ),
                  child: pw.Text(
                      "(${eduData['startDate']})to(${eduData['endDate']})",
                      style: pw.Theme.of(context).defaultTextStyle.copyWith(
                          fontWeight: pw.FontWeight.bold,
                          color: white,
                          fontSize: 10)),
                ),
              ]),
        ]);
  }
}

//--------------------------

class Exp_Block extends pw.StatelessWidget {
  Exp_Block({
    required this.expData,
  });

  final Map expData;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
            children: <pw.Widget>[
              pw.Container(
                padding: pw.EdgeInsets.only(left: 30, top: 20),
                child: pw.Text(expData['endDate'],
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
              ),
              SizedBox(width: 10),
              pw.Container(
                  padding: pw.EdgeInsets.only(left: 10, top: 20, right: 20),
                  child: pw.Text(
                    expData['name'],
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Container(
            padding: pw.EdgeInsets.only(left: 110, right: 20),
            child: pw.Text(expData['des'],
                style: pw.Theme.of(context).defaultTextStyle),
          ),
        ]);
  }
}

class Page_H1 extends pw.StatelessWidget {
  Page_H1({required this.title});
  final String title;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 10, top: 20, left: 30),
            child: pw.Text(
              title,
              textScaleFactor: 1.5,
            ),
          ),
          pw.Container(
              margin: EdgeInsets.only(left: 30),
              height: 1,
              width: 350,
              color: black),
        ]);
  }
}

class Hob_Block extends pw.StatelessWidget {
  Hob_Block({
    required this.hobData,
  });
  final Map hobData;
  PdfColor get color => green;
  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      Container(
          child: pw.Row(children: [
        pw.SizedBox(
          width: 80,
          child: Text(
            "${hobData["name"]}",
            style: TextStyle(color: white),
          ),
        ),
        pw.SizedBox(width: 10),
        pw.SizedBox(
            width: 70,
            child: pw.LinearProgressIndicator(value: hobData["rating"]))
      ])),
    ];
    return pw.Column(children: widgets);
  }
}

class SideBar_H1 extends pw.StatelessWidget {
  SideBar_H1({
    required this.title,
  });
  final String title;
  PdfColor get color => green;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      pw.Container(
        child: Text(
          title,
          style: TextStyle(color: white, fontSize: 16),
        ),
      ),
      pw.SizedBox(height: 10),
      pw.Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        pw.Container(height: 1, width: 130, color: yellow),
      ]),
    ]);
  }
}
