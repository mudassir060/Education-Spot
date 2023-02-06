import 'package:education_spot/Screens/Community/communityScreen.dart';
import 'package:education_spot/Screens/Home/homeScreen.dart';
import 'package:education_spot/Screens/Notification/notificationScreen.dart';
import 'package:education_spot/Screens/Profile/profileScreen.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';



class BottomNavigBar extends StatefulWidget {
  final Map UserData;

  const BottomNavigBar({super.key, required this.UserData});

  @override
  State<BottomNavigBar> createState() => _BottomNavigBarState();
}

class _BottomNavigBarState extends State<BottomNavigBar> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     List<Widget> _widgetOptions = <Widget>[
       homeScreen(UserData: widget.UserData,),
      communityScreen(UserData: widget.UserData,),
      const notificationScreen(),
      profileScreen(UserData:  widget.UserData,)
    ];
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
