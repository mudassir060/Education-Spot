import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../Widgets/webView.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class recomendedCard extends StatelessWidget {
  final String img;
  final String titel;
  final String subTitel;
  final String location;
  final String timing;
  final String sallery;
  final String url;

  const recomendedCard(
      {Key? key,
      required this.titel,
      required this.subTitel,
      required this.location,
      required this.timing,
      required this.sallery,
      required this.img, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("=========================>>>${img}");
    return Container(
      width: 300,
      // height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(left: 15.0),
      child: Column(
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
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              mySpacer(0.0, 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titel,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitel,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.av_timer,
                        color: Colors.grey,
                      ),
                      Text(
                        timing,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.badge,
                        color: Colors.grey,
                      ),
                      Text(
                        "\$ $sallery",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => webView(url: url,)),
                      );
                    },
                    child: const Center(
                        child: Text(
                      "Apply",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
