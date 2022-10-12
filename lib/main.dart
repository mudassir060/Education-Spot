import 'package:education_spot/Screens/authentication/signInScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/Chats/PriviteChat/inbox_screen.dart';
import 'Widgets/BottomNavigBar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education Spot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigBar(),
    );
  }
}
