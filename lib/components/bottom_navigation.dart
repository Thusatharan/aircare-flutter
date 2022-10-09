import 'package:aircare/constants.dart';
import 'package:aircare/screens/elders-care.dart';
import 'package:aircare/screens/gurdians.dart';
import 'package:aircare/screens/relatives.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aircare/constants.dart';

import '../screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Guardians(),
    Relatives(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.accessibility,
              color: kPrimaryColor,
            ),
            label: "Elders Care",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_outdoor_rounded,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.camera_outdoor,
              color: kPrimaryColor,
            ),
            label: "Guardians",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.handshake_rounded,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.handshake,
              color: kPrimaryColor,
            ),
            label: "Relatives",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
