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
             
               SizedBox(
                height: 600,
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: StackedCardCarousel(
                    spaceBetweenItems: 200,
                         items:[  
                          cvCard(),
                          cvCard(),
                          cvCard(),
                          cvCard(),
                          cvCard(),
                         ]
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
