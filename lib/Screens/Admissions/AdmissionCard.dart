import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../Widgets/webView.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class AdmissionCard extends StatelessWidget {
  final String img;
  final String institute;
  final String discipline_type;
  final String level;
  final String last_date;
  final String url;

  const AdmissionCard(
      {Key? key,
      required this.institute,
      required this.discipline_type,
      required this.level,
      required this.last_date,
      required this.img, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;

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
                      SizedBox(
                        width: 250,
                        child: Text(
                          institute,
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
                discipline_type,    maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  const  Icon(
                    Icons.school_outlined,
                    color: Colors.grey,
                  ),
                  Container(
                    width: vwidth-50,
                    child: Text(
                      level,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
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
                         const Icon(
                            Icons.schedule,
                            color: Colors.red,
                          ),
                          Text(
                            last_date,
                            style:const TextStyle(
                              fontSize: 15,
                              color: Colors.red,
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
                              fontSize: 15,
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
