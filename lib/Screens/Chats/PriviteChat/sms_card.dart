import 'package:flutter/material.dart';

import '../../../constants/style.dart';


class sms_card extends StatefulWidget {
  final String username;
  final String sendername;
  final String sms;
  final String profile;
  final String time;
  const sms_card({Key? key, required this.username, required this.sendername, required this.sms, required this.profile, required this.time}) : super(key: key);

  @override
  State<sms_card> createState() => _sms_cardState();
}

class _sms_cardState extends State<sms_card> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;

    return    Column(children: [
      SizedBox(
        height: 2,
      ),
      SizedBox(
          width: vwidth - 25,
          child: widget.username == widget.sendername
              ? Column(
            mainAxisAlignment:
            MainAxisAlignment.end,
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: active,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(widget.profile, fit: BoxFit.contain),
                ),),
              SizedBox(
                height: 2,
              ),
              Container(
                decoration: new BoxDecoration(
                  borderRadius:
                  BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  color: Colors.lightBlue.shade50,
                ),
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                  minHeight: 40,
                  maxWidth: vwidth / 2.1,
                  minWidth: 100,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.all(8),
                      child: Text(widget.sms),
                    ),
                    Positioned(
                        right: 8,
                        bottom: 4,
                        child: Text(
                          widget.time,
                          style: TextStyle(
                              fontSize: 10),
                        )),
                  ],
                ),
              ),
            ],
          )
              : Column(
            mainAxisAlignment:
            MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(widget.profile, fit: BoxFit.contain),
                ),),
              SizedBox(
                height: 2,
              ),
              Container(
                decoration: new BoxDecoration(
                  borderRadius:
                  new BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Colors.white,
                ),
                constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: 40,
                    maxWidth: vwidth / 2.1,
                    minWidth: 100),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.all(8),
                      child: Text(widget.sms),
                    ),
                    Positioned(
                        right: 8,
                        bottom: 4,
                        child: Text(
                          widget.time,
                          style: TextStyle(
                              fontSize: 10),
                        )),
                  ],
                ),
              ),
            ],
          )),
    ])    ;
  }
}
