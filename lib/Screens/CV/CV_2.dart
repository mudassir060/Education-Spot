import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../constants/images.dart';

const PdfColor blue = PdfColor.fromInt(0xFF4171C3);
const PdfColor lightBlue = PdfColor.fromInt(0xFF4171C3);
const PdfColor white = PdfColor.fromInt(0xFFFFFFFF);
const sep = 120.0;

Future<Uint8List> CV_2(data) async {
  final doc = pw.Document(title: 'My Résumé', author: '${data["username"]}');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load(Profile)).buffer.asUint8List(),
  );
  final pageTheme = await _myPageTheme(PdfPageFormat.a4);

  doc.addPage(
    // pw.MultiPage(
    pw.Page(
      pageTheme: pageTheme,
      build: (pw.Context context) => pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pw.Stack(children: [
                pw.Padding(
                  padding: EdgeInsets.only(left: 70, top: 25, bottom: 20),
                  child: pw.Container(
                    decoration: const BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    padding: const pw.EdgeInsets.only(
                        left: 50, bottom: 10, top: 10, right: 10),
                    child: pw.Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <pw.Widget>[
                        pw.Text('${data["username"]}',
                            textScaleFactor: 1.7,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: white)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 5)),
                        pw.Text('${data["job"]}',
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: white)),
                      ],
                    ),
                  ),
                ),
                pw.ClipOval(
                  child: pw.Container(
                    width: 120,
                    height: 120,
                    color: lightBlue,
                    child: pw.Image(profileImage),
                  ),
                ),
              ]),
              pw.Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pw.Text('${data["PhoneNo"]}'),
                    _UrlText('${data["email"]}', 'mailto:${data["email"]}'),
                    pw.Text('${data["address"]}'),
                    _UrlText('${data["web"]}', '${data["web"]}'),
                    pw.Padding(padding: pw.EdgeInsets.zero)
                  ]),
              // pw.Container(
              //   height: pageTheme.pageFormat.availableHeight,
              //   child: pw.Column(
              //     crossAxisAlignment: pw.CrossAxisAlignment.center,
              //     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              //     children: <pw.Widget>[

              //       pw.Column(children: <pw.Widget>[
              //         if (data["Skills"].length != null)
              //           pw.ListView.builder(
              //             itemCount: data["Skills"].length,
              //             itemBuilder: (context, int index) {
              //               return _Percent(
              //                   perData: data["Skills"][index]);
              //             },
              //           ),
              //       ]),
              //       pw.Container(),
              //       pw.Container(),
              //       pw.Container(),
              //       // pw.BarcodeWidget(
              //       //   data: 'Parnella Charlesbois',
              //       //   width: 60,
              //       //   height: 60,
              //       //   barcode: pw.Barcode.qrCode(),
              //       //   drawText: false,
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              if (data["about_me"] != null) _Category(title: 'About Me'),
              if (data["about_me"] != null) pw.Text(data["about_me"]),
              if (data["experiences"].length != null)
                _Category(title: 'Work Experience'),
              if (data["experiences"].length != null)
                pw.ListView.builder(
                  itemCount: data["experiences"].length,
                  itemBuilder: (context, int index) {
                    return Exp_Block(expData: data["experiences"][index]);
                  },
                ),
              // pw.SizedBox(height: 10),
              if (data["Education"].length != null)
                _Category(title: 'Education'),
              if (data["Education"].length != null)
                pw.ListView.builder(
                  itemCount: data["Education"].length,
                  itemBuilder: (context, int index) {
                    return Education_Block(eduData: data["Education"][index]);
                  },
                ),
              // pw.SizedBox(height: 10),
              pw.Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (data["Hobbies"].length != null)
                            _Category(title: 'Hobbies'),
                          if (data["Hobbies"].length != null)
                            pw.ListView.builder(
                              itemCount: data["Hobbies"].length,
                              itemBuilder: (context, int index) {
                                return Hob_Block(
                                    hobData: data["Hobbies"][index]);
                              },
                            ),
                        ]),
                    pw.Container(width: 2, height: 80, color: blue),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (data["Language"].length != null)
                            _Category(title: 'Language'),
                          if (data["Language"].length != null)
                            pw.ListView.builder(
                              itemCount: data["Language"].length,
                              itemBuilder: (context, int index) {
                                return Hob_Block(
                                    hobData: data["Language"][index]);
                              },
                            ),
                        ]),
                    pw.Container(),
                  ])
            ],
          ),
        ],
      ),
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape_1 = await rootBundle.loadString(cvBg_2_1);
  final bgShape_2 = await rootBundle.loadString(cvBg_2_2);

  format = format.applyMargin(
      left: 0 * PdfPageFormat.cm,
      top: 0 * PdfPageFormat.cm,
      right: 0 * PdfPageFormat.cm,
      bottom: 0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    margin: EdgeInsets.all(30),
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(
                svg: bgShape_1,
                height: 350,
              ),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.SvgImage(
                svg: bgShape_2,
                height: 350,
              ),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
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
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: blue,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(eduData["name"],
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                pw.Text(eduData["uni"]),
                pw.Spacer(),
                pw.Text("(${eduData['startDate']}) To (${eduData['endDate']})",
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
              ]),
        ]);
  }
}

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
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: blue,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(expData['name'],
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                pw.Text("(${expData['startDate']}) To (${expData['endDate']})",
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: blue, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(expData['des'],
                      style: pw.Theme.of(context).defaultTextStyle.copyWith()),
                  // pw.Spacer(),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightBlue,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
        style: pw.Theme.of(context).defaultTextStyle.copyWith(color: white),
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.perData,
  });

  final Map perData;

  static const fontSize = 1.2;

  PdfColor get color => blue;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: 70,
        height: 70,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(perData["rating"] * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: perData["rating"],
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(pw.Text(perData["name"]));

    return pw.Column(children: widgets);
  }
}

class Hob_Block extends pw.StatelessWidget {
  Hob_Block({
    required this.hobData,
  });
  final Map hobData;
  PdfColor get color => blue;
  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Row(children: [
        pw.SizedBox(
          width: 80,
          child: pw.Text("${hobData["name"]}"),
        ),
        pw.SizedBox(width: 10),
        pw.SizedBox(
            width: 70,
            child: pw.LinearProgressIndicator(value: hobData["rating"]))
      ])
    ];
    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
