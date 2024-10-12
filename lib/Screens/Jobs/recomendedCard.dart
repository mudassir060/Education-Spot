import 'package:flutter/material.dart';

import '../../Widgets/ImageCasha.dart';
import '../../Widgets/mySpacer.dart';
import '../../Widgets/webView.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class recomendedCard extends StatelessWidget {
  final String img;
  final String titel;
  final String posetion;
  final String location;
  final String publishDate;
  final String lastDate;
  final String url;

  // title: titles[index],
  // lastDate: lastDates[index],
  // url: urls[index].toString(),
  // posetion: posetions[index],
  // publishDate: publishDates[index],
  // location: locations[index],
  // img: imgs[index].toString()));

  const recomendedCard(
      {Key? key,
      required this.titel,
      required this.posetion,
      required this.location,
      required this.publishDate,
      required this.lastDate,
      required this.img,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewPage(
                      url: url,
                    )),
          );
        },
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
                        // image: DecorationImage(
                        //   image: NetworkImage(img),
                        //   fit: BoxFit.fitHeight,
                        // ),
                      ),
                      child: imageCasha(img),
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
                mySpacer(5.0, 0.0),
                Text(
                  posetion,
                  style: TextStyle(fontSize: 16),
                ),
                mySpacer(5.0, 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Location: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        mySpacer(5.0, 0.0),
                        Row(
                          children: [
                            // Icon(
                            //   Icons.av_timer,
                            //   color: Colors.grey,
                            // ),
                            const Text(
                              "Publish Date: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              publishDate.substring(14),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        mySpacer(5.0, 0.0),
                        Row(
                          children: [
                            const Text(
                              "Last Date: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            // Icon(
                            //   Icons.access_time_rounded,
                            //   color: Colors.grey,
                            // ),
                            Text(
                              "$lastDate",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: 100,
                    //     height: 40,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: primaryColor,
                    //     ),
                    //     child: InkWell(
                    //       onTap: (){
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => webView(url: url,)),
                    //         );
                    //       },
                    //       child: const Center(
                    //           child: Text(
                    //         "Apply",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.bold),
                    //       )),
                    //     ),
                    //   ),
                    // ),
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
