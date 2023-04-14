import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myTextfield extends StatelessWidget {
  final String titel;
  final String hint;
  final TextEditingController textcontroler;
  const myTextfield({
    Key? key,
    required this.titel,
    required this.hint,
    required this.textcontroler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          " $titel",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        mySpacer(5.0, 0.0),
        SizedBox(
          height: 50,
          child: TextField(
            controller: textcontroler,
            decoration: InputDecoration(
              hintText: "Enter your $hint",
              filled: true,
              fillColor: Colors.white,
              // fillColor: Color.fromRGBO(235, 235, 245, 0.9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MLTextfield extends StatelessWidget {
  final String titel;
  final String hint;
  final TextEditingController textcontroler;
  const MLTextfield({
    Key? key,
    required this.titel,
    required this.hint,
    required this.textcontroler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          " $titel",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        mySpacer(5.0, 0.0),
        TextField(
          controller: textcontroler,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Enter your $hint",
            filled: true,
            fillColor: Colors.white,
            // fillColor: Color.fromRGBO(235, 235, 245, 0.9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
