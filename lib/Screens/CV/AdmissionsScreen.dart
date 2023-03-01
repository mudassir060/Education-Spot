import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import '../../Widgets/myAppBar.dart';
import '../../Widgets/myLoading.dart';

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
                titel: "CV",
                linewidth: 140,
              ),
             
               Center(child: myLoading()),
            ],
          ),
        ),
      ),
    );
  }
}
