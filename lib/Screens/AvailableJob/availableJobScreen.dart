import 'package:flutter/cupertino.dart';

class AvailableJobScreen extends StatefulWidget {
  const AvailableJobScreen({Key? key}) : super(key: key);

  @override
  State<AvailableJobScreen> createState() => _AvailableJobScreenState();
}

class _AvailableJobScreenState extends State<AvailableJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("AvailableJob"),);
  }
}
