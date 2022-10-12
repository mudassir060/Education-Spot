import 'package:flutter/material.dart';

import '../../Widgets/myAppBar.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
      children: [
        myAppBar(titel: "Quizz"),
        Text("Quizz"),
      ],
    ))));
  }
}
