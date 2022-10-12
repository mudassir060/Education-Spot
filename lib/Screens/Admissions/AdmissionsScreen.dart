import 'package:flutter/material.dart';

import '../../Widgets/myAppBar.dart';

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
                child: Column(
                  children: [
                    myAppBar(titel: "Admissions"),
                    Text("Admissions"),
                  ],
                ))));
  }
}
