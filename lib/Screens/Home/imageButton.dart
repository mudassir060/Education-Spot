import 'package:education_spot/constants/images.dart';
import 'package:flutter/material.dart';

class imageButton extends StatelessWidget {
  final String img;
  final String titel;
  final Function fun;
  const imageButton({Key? key, required this.img, required this.titel, required this.fun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,

      child: InkWell(
        onTap: (){
          fun();
          },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                Text(
                  titel,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
               Image.asset(exit, height: 40,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
