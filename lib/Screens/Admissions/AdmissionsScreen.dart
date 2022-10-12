import 'package:flutter/material.dart';

class AdmissionsScreen extends StatefulWidget {
  const AdmissionsScreen({Key? key}) : super(key: key);

  @override
  State<AdmissionsScreen> createState() => _AdmissionsScreenState();
}

class _AdmissionsScreenState extends State<AdmissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Center(child: Text("Admissions")),
    )));
  }
}
