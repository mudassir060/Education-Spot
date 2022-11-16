import 'package:education_spot/Screens/Quizz/widget/rowCard.dart';
import 'package:flutter/material.dart';

import '../../Widgets/myAppBar.dart';
import '../../constants/images.dart';
import 'Data.dart';

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
        const myAppBar(titel: "Quiz", linewidth: 75,),
        rowCard(img:Quiz, title: 'MCAT',question:MCAT),
        rowCard(img:Quiz, title: 'ECAT',question:ECAT),
        rowCard(img:Quiz, title: 'PMS',question:PMS),
      ],
    ))));
  }
}
