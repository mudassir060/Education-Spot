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
                    height: 600,
                    width: 900,
                    color: black,
                    child: pw.Stack(
                      children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              //pw.Padding(padding: pw.EdgeInsets.only(left: 30)),
                              pw.Container(
                                  height: 150,
                                  width: 400,
                                  //color: black,
                                  child: pw.Image(profileImage)),
                              pw.SizedBox(height: 10),
                              //pw.margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
                              pw.Container(
                                padding: const pw.EdgeInsets.only(
                                  left: 14,
                                ),
                                child: Text(
                                  "Education",
                                  style: TextStyle(color: white, fontSize: 16),
                                ),
                              ),

                              pw.SizedBox(height: 10),
                              pw.Container(
                                  //padding: const pw.EdgeInsets.only(left:20),
                                  margin: EdgeInsets.only(left: 14),
                                  height: 1,
                                  width: 130,
                                  color: yellow),

                              // if (data["Education"].length != null)
                              // _Category(title: 'Education'),
                              pw.SizedBox(height: 10),
                              if (data["Education"].length != null)
                                pw.ListView.builder(
                                  itemCount: data["Education"].length,
                                  itemBuilder: (context, int index) {
                                    return Education_Block(
                                        eduData: data["Education"][index]);
                                  },
                                ),

                              pw.SizedBox(height: 20),

                              pw.Container(
                                padding: const pw.EdgeInsets.only(
                                  left: 14,
                                ),
                                child: Text(
                                  "Reference",
                                  style: TextStyle(color: white, fontSize: 16),
                                ),
                              ),

                              pw.SizedBox(height: 10),
                              pw.Container(
                                  //padding: const pw.EdgeInsets.only(left:20),
                                  margin: EdgeInsets.only(left: 14),
                                  height: 1,
                                  width: 130,
                                  color: yellow),

                              // if (data["Education"].length != null)
                              // _Category(title: 'Education'),
                              // pw.SizedBox(height: 10),
                              // if (data["Reference"].length != null)
                              //   pw.ListView.builder(
                              //     itemCount: data["Reference"].length,
                              //     itemBuilder: (context, int index) {
                              //       return Reference_Block(
                              //         software: data["Reference"][index],
                              //       );
                              //     },
                              //   ),

                              pw.SizedBox(height: 30),
                              pw.Row(
                                children: [
                                  Container(
                                      height: 15, width: 30, color: yellow),
                                  Container(
                                    height: 15,
                                    width: 120,
                                    color: light_black,
                                    padding: const pw.EdgeInsets.only(
                                        left: 10, bottom: 5),
                                    child: Text(
                                      'Phone:',
                                      style:
                                          TextStyle(color: white, fontSize: 10),
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
                                  Container(
                                      height: 15, width: 30, color: yellow),
                                  Container(
                                    height: 15,
                                    width: 120,
                                    color: light_black,
                                    padding: const pw.EdgeInsets.only(
                                        left: 10, bottom: 5),
                                    child: Text(
                                      'Email:',
                                      style:
                                          TextStyle(color: white, fontSize: 10),
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
                                  Container(
                                      height: 15, width: 30, color: yellow),
                                  Container(
                                    height: 15,
                                    width: 120,
                                    color: light_black,
                                    padding: const pw.EdgeInsets.only(
                                        left: 10, bottom: 5),
                                    child: Text(
                                      'Website:',
                                      style:
                                          TextStyle(color: white, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const pw.EdgeInsets.only(
                                  left: 30,
                                ),
                                child: pw.Text('${data["web"]}',
                                    style:
                                        TextStyle(color: white, fontSize: 10)),
                              ),

                              SizedBox(height: 10),

                              pw.Row(
                                children: [
                                  Container(
                                      height: 15, width: 30, color: yellow),
                                  Container(
                                    height: 15,
                                    width: 120,
                                    color: light_black,
                                    padding: const pw.EdgeInsets.only(
                                        left: 10, bottom: 5),
                                    child: Text(
                                      'Address:',
                                      style:
                                          TextStyle(color: white, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const pw.EdgeInsets.only(
                                  left: 30,
                                ),
                                child: pw.Text('${data["address"]}',
                                    style:
                                        TextStyle(color: white, fontSize: 10)),
                              ),

                              // pw.Row(children: [
                              //   Container(height: 10, width: 30, color: yellow),
                              //   Container(
                              //       child: pw.Column(children: [
                              //     pw.Text('Email:'),
                              //     Container(
                              //       margin: EdgeInsets.only(left: 10),
                              //       child: _UrlText('${data["email"]}',
                              //           'mailto:${data["email"]}'),
                              //     )
                              //   ]))
                              // ])
                            ]),
                      ],

                      // Education(),

                      //pw.Text("Education",style: TextStyle(color: green))
                    )

                    //child: pw.Container(height: 200,width: 200,color: black )
                    // height: pageTheme.pageFormat.availableHeight,
                    // child: pw.Column(
                    //   crossAxisAlignment: pw.CrossAxisAlignment.center,
                    //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    //   children: <pw.Widget>[
                    //     pw.ClipOval(
                    //       child: pw.Container(
                    //         width: 100,
                    //         height: 100,
                    //         color: lightGreen,
                    //         child: pw.Image(profileImage),
                    //       ),
                    //     ),
                    //     pw.Column(children: <pw.Widget>[
                    //       if (data["Skills"].length != null)
                    //         pw.ListView.builder(
                    //           itemCount: data["Skills"].length,
                    //           itemBuilder: (context, int index) {
                    //             return _Percent(perData: data["Skills"][index]);
                    //           },
                    //         ),
                    //     ]),
                    //     pw.Container(),
                    //     pw.Container(),
                    //     pw.Container(),
                    //     // pw.BarcodeWidget(
                    //     //   data: 'Parnella Charlesbois',
                    //     //   width: 60,
                    //     //   height: 60,
                    //     //   barcode: pw.Barcode.qrCode(),
                    //     //   drawText: false,
                    //     // ),
                    //   ],
                    // ),
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
                      //   pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),

                      //   pw.Row(
                      //     crossAxisAlignment: pw.CrossAxisAlignment.start,
                      //     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      //     children: <pw.Widget>[
                      //       pw.Column(
                      //         crossAxisAlignment: pw.CrossAxisAlignment.start,
                      //         children: <pw.Widget>[
                      //           pw.Text('${data["PhoneNo"]}'),
                      //           _UrlText('${data["email"]}',
                      //               'mailto:${data["email"]}'),
                      //         ],
                      //       ),
                      //       pw.Column(
                      //         crossAxisAlignment: pw.CrossAxisAlignment.start,
                      //         children: <pw.Widget>[
                      //           pw.Text('${data["address"]}'),
                      //           _UrlText('${data["web"]}', '${data["web"]}'),
                      //         ],
                      //       ),
                      //       pw.Padding(padding: pw.EdgeInsets.zero)
                      //     ],
                      //   ),
                    ],
                  ),
                ),

                if (data["about_me"] != null) _Category(title: 'About Me'),
                pw.Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: data["about_me"] != null
                      ? pw.Text(data["about_me"])
                      : pw.Text("No data available"),
                ),

                if (data["experiences"].length != null)
                  _Category(title: 'Work Experience'),
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

                // pw.SizedBox(height: 10),
                // if (data["Education"].length != null)
                //   _Category(title: 'Education'),
                // if (data["Education"].length != null)
                //   pw.ListView.builder(
                //     itemCount: data["Education"].length,
                //     itemBuilder: (context, int index) {
                //       return Education_Block(eduData: data["Education"][index]);
                //     },
                //   ),
                // pw.SizedBox(height: 10),
                pw.Row(
                  
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      Column(children: [
                        if (data["Skills"].length != null)
                          _Category(title: 'Software Skills'),

                        Container(
                          margin: EdgeInsets.only( top: 20),
                        child:data["Skills"].length != null?

                          pw.ListView.builder(
                            itemCount: data["Skills"].length,
                            itemBuilder: (context, int index) {
                              return Hob_Block(hobData: data["Skills"][index]);
                            },
                          ):
                          pw.Text("No data available"),
                        )
                      ]),

                
                      // pw.Container(width: 2, height: 80, color: green),
                      // Column(children: [
                      //   if (data["Language"].length != null)
                      //     _Category(title: 'Language'),
                      //   if (data["Language"].length != null)
                      //     pw.ListView.builder(
                      //       itemCount: data["Language"].length,
                      //       itemBuilder: (context, int index) {
                      //         return Hob_Block(
                      //             hobData: data["Language"][index]);
                      //       },
                      //     ),
                      // ])
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
    // buildBackground: (pw.Context context) {
    //   return pw.FullPage(
    //     ignoreMargins: true,
    //     child: pw.Stack(
    //       children: [
    //         pw.Positioned(
    //           child: pw.SvgImage(svg: bgShape),
    //           left: 0,
    //           top: 0,
    //         ),
    //         pw.Positioned(
    //           child: pw.Transform.rotate(
    //               angle: pi, child: pw.SvgImage(svg: bgShape)),
    //           right: 0,
    //           bottom: 0,
    //         ),
    //       ],
    //     ),
    //   );

    // },
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
                // pw.Container(
                //   width: 6,
                //   height: 6,
                //   margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                //   decoration: const pw.BoxDecoration(
                //     color: green,
                //     shape: pw.BoxShape.circle,
                //   ),
                // ),
                pw.Row(children: [
                  Container(
                    padding: const pw.EdgeInsets.only(
                      left: 14,
                    ),
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

class Reference_Block extends pw.StatelessWidget {
  Reference_Block({
    required this.software,
  });

  final Map software;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                Container(
                  padding: const pw.EdgeInsets.only(
                    left: 14,
                  ),

                  // pw.Container(
                  //   width: 6,
                  //   height: 6,
                  //   margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  //   decoration: const pw.BoxDecoration(
                  //     color: green,
                  //     shape: pw.BoxShape.circle,
                  //   ),
                  // ),

                  child: pw.Text(software["software"],
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(color: white)),
                )
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
            //crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              // pw.Container(
              //   width: 6,
              //   height: 6,
              //   margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),

              // ),
              // pw.Text(expData['name'],
              //     style: pw.Theme.of(context)
              //         .defaultTextStyle
              //         .copyWith(fontWeight: pw.FontWeight.bold)),
              // pw.Spacer(),
              pw.Container(
                padding: pw.EdgeInsets.only(left: 30, top: 20),
                child: //pw.Text("(${expData['endDate']})"
                    pw.Text(expData['endDate'],
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(fontWeight: pw.FontWeight.bold)),
              ),

              SizedBox(width: 10),

              pw.Container(
                padding: pw.EdgeInsets.only(left: 10, top: 20,right: 20),

                child: pw.Text(expData['name'],
                  style: pw.Theme.of(context).defaultTextStyle.copyWith(fontWeight: FontWeight.bold),

                //  
                )
                // container(
                //
                // )
              ),
            ],
          ),
           Container(
                    padding: pw.EdgeInsets.only(left: 110,right: 20),

                    //  height: 100,
                    //  width: 300,
                    //  color: yellow,
                     child:  pw.Text( expData['des'],
                style: pw.Theme.of(context)
                    .defaultTextStyle
                   ),

                 
                   ),


          // child:

          // pw.Container(
          //   decoration: const pw.BoxDecoration(
          //       border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
          //   padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
          //   margin: const pw.EdgeInsets.only(left: 5),
          //   child: pw.Column(
          //       crossAxisAlignment: pw.CrossAxisAlignment.start,
          //       children: <pw.Widget>[
          //         pw.Text(expData['des'],
          //             style: pw.Theme.of(context).defaultTextStyle.copyWith()),
          //         // pw.Spacer(),
          //       ]),
          // ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            // decoration: const pw.BoxDecoration(
            //   color: lightGreen,
            //   borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
            // ),
            margin: const pw.EdgeInsets.only(bottom: 10, top: 20, left: 30),

            //margin: EdgeInsets.only(left: 30),
            child: pw.Text(
              title,
              textScaleFactor: 1.5,
            ),
          ),
          pw.Container(
              //padding: const pw.EdgeInsets.only(left:20),
              margin: EdgeInsets.only(left: 30),
              height: 1,
              width: 350,
              color: black),
        ]);
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.perData,
  });

  final Map perData;

  static const fontSize = 1.2;

  PdfColor get color => green;

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
  PdfColor get color => green;
  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      
      Container(
       
          
      child:pw.Row(children: [
       
        pw.SizedBox(
          width: 80,
          child: pw.Text("${hobData["name"]}"),
        ),
        pw.SizedBox(width: 10),
        pw.SizedBox(
            width: 70,
            child: pw.LinearProgressIndicator(value: hobData["rating"]))
      ])
      ),
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
