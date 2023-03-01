import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import '../../Widgets/myAppBar.dart';
import '../../Widgets/myLoading.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import 'cvCard.dart';
class CVScreen extends StatefulWidget {
  const CVScreen({Key? key}) : super(key: key);

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
              myAppBar(
                titel: "Create CV",
                linewidth: 140,
              ),
             
               Container(             color: Colors.amberAccent,

                 child: SizedBox(
                  height: 700,
                   child: Padding(
                     padding: const EdgeInsets.only(left:15.0, right: 15.0),
                     child: StackedCardCarousel(
                      initialOffset: 0,
                      spaceBetweenItems: 400,
                           items:[  
                            cvCard(),
                            cvCard(),
                            cvCard(),
                            cvCard(),
                            cvCard(),
                           ]
                       ),
                   ),
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
