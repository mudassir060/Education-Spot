import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jobsScreen extends StatefulWidget {
  const jobsScreen({Key? key}) : super(key: key);

  @override
  State<jobsScreen> createState() => _jobsScreenState();
}

class _jobsScreenState extends State<jobsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Text("Discover your dream job"),
    ));
  }
}
