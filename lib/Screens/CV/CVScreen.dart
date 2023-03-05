import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import '../../Widgets/BottomNavigBar.dart';
import '../../Widgets/myAppBar.dart';
import '../../Widgets/myLoading.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';
import 'cvCard.dart';

class CVScreen extends StatefulWidget {
  final Map UserData;
  const CVScreen({Key? key, required this.UserData}) : super(key: key);

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigBar(
                                    UserData: widget.UserData,
                                  )),
                        );
                      },
                      child: Image.asset(backCurve)),
                  mySpacer(0.0, 0.0),
                  Column(
                    children: [
                      Text(
                        "Create CV",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      mySpacer(10.0, 0.0),
                      Container(
                        width: 140,
                        height: 2,
                        color: primaryColor,
                      )
                    ],
                  ),
                  mySpacer(0.0, 0.0),
                  mySpacer(0.0, 0.0),
                ],
              ),
              SizedBox(
                height: 700,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: StackedCardCarousel(
                      initialOffset: 0,
                      spaceBetweenItems: 450,
                      items: [
                        cvCard(context, widget.UserData, cv_1),
                        cvCard(context, widget.UserData, cv_1),
                        cvCard(context, widget.UserData, cv_1),
                        cvCard(context, widget.UserData, cv_1),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
