import 'package:education_spot/Screens/Community/communityScreen.dart';
import 'package:education_spot/Screens/Home/homeScreen.dart';
import 'package:education_spot/Screens/Notification/notificationScreen.dart';
import 'package:education_spot/Screens/Profile/profileScreen.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';



class BottomNavigBar extends StatefulWidget {
  const BottomNavigBar({super.key});

  @override
  State<BottomNavigBar> createState() => _BottomNavigBarState();
}

class _BottomNavigBarState extends State<BottomNavigBar> {
  int _selectedIndex = 0;
 static const List<Widget> _widgetOptions = <Widget>[
    homeScreen(),
    communityScreen(),
    notificationScreen(),
    profileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,

        onTap: _onItemTapped,
      ),
    );
  }
}
