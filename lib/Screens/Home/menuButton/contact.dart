import 'package:app_screen/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 245, 212, 222),
                  Color.fromARGB(255, 227, 243, 209),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 235, 235),
                  borderRadius: BorderRadius.circular(10)),
               height: isSmallScreen ? 300 : 290,
               width: isSmallScreen ? 300 : 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 250, top: 10),
                    child: Icon(Icons.close),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Contact Us",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Name", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 5),
                    child: Text(
                      "Drew Feight",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 2,
                    color: Color.fromARGB(255, 228, 226, 226),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Email", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 5),
                    child: Text(
                      "abc@gmail.com",
                      style: TextStyle(
                          color: Color.fromRGBO(158, 92, 233, 1), fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 2,
                    color: Color.fromARGB(255, 228, 226, 226),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Message", style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 2,
                    color: Color.fromARGB(255, 228, 226, 226),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image(image: AssetImage(send)),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "SEND",
                        style: TextStyle(
                            color: Color.fromRGBO(158, 92, 233, 1),
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

         Positioned(
          left:100,
          top: 600,
          child: Container(
            height: 200,
            width: 200,
            child: Center(child: Image(image: AssetImage(number)))),)  
        
        ],
      ),
    );
  }
}
