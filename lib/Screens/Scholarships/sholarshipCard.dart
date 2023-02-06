import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../Widgets/smallButton.dart';
import '../../Widgets/webView.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class sholarshipCard extends StatelessWidget {
  final String img;
  final String titel;
  final String type;
  final String deadline;
  final String url;
  final String field;
  final String level;
  final String category;
  final String area;

  const sholarshipCard({
    Key? key,
    required this.img,
    required this.titel,
    required this.type,
    required this.url,
    required this.field,
    required this.level,
    required this.category,
    required this.deadline,
    required this.area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child:   InkWell(
        onTap: () {
          print(img);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => webView(
          //         url: url,
          //       )),
          // );
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    mySpacer(0.0, 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            titel,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                mySpacer(10.0, 0.0),

                Text(
                  "Levels: $level",
                  style: TextStyle(fontSize: 15),
                ),
                mySpacer(10.0, 0.0),

                Text(
                  "Fields: $field",
                  style: TextStyle(fontSize: 15),
                ),
                mySpacer(10.0, 0.0),

                Text(
                  "Deadline: $deadline",
                  style: TextStyle(fontSize: 15),
                ),
                mySpacer(10.0, 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textshow("Type", type, vwidth),
                    Container(width: 1,height: 60, color: Colors.grey,),
                    textshow("Category", category, vwidth),
                    Container(width: 1,height: 60,color: Colors.grey,),
                    textshow("Area", area, vwidth),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}

Widget textshow(title, subtitle, vwidth) {
  return Container(
    width: vwidth/4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
