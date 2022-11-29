import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../Widgets/webView.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class AdmissionCard extends StatelessWidget {
  final String institute;
  final String level;
  final String last_date;
  final String discipline_type;
  final String url;

  const AdmissionCard(
      {Key? key,
      required this.level,
      required this.last_date,
      required this.discipline_type,
      required this.institute, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: Container(
          // width: 600,
          // height: 170,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   color: Colors.white,
          // ),
          padding: const EdgeInsets.all(8.0),
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
                        image: NetworkImage(institute),
                        fit: BoxFit.fill,
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
                          level,
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
              Text(
                last_date,
                style: TextStyle(fontSize: 16),
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
                            discipline_type,
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
                            "timing",
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
                            "sallery",
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
        ),
      ),
    );
  }
}
