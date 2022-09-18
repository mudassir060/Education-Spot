import 'package:education_spot/Screens/Jobs/jobsScreen.dart';
import 'package:education_spot/Screens/Profile/profileScreen.dart';
import 'package:education_spot/Screens/authentication/signInScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/Chats/CommunityChat/communityChatScreen.dart';
import 'Screens/Scholarships/sholarshipsScreen.dart';
import 'Screens/authentication/sigupScreen.dart';
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
      home: const signInScreen(),
    );
  }
}
