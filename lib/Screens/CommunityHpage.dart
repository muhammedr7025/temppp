import 'package:air_pollution/Screens/comm_posts_page.dart';
import 'package:air_pollution/Screens/emergency_contact.dart';
import 'package:air_pollution/Screens/usrsetiings.dart';
import 'package:air_pollution/Screens/weather_page.dart';
import 'package:flutter/material.dart';

import 'PostomePage.dart';
import 'addPost.dart';

class CommunityHpage extends StatefulWidget {
  const CommunityHpage({Key? key}) : super(key: key);

  @override
  State<CommunityHpage> createState() => _CommunityHpageState();
}

class _CommunityHpageState extends State<CommunityHpage> {
  int _selectpage = 0;

  void _navigatorPage(int index) {
    setState(() {
      _selectpage = index;
    });
  }

  final List<Widget> Pages = [
    WeatherPage(),
    CommunityPosts(isAdmin: false),
    EmergencyContact(
      role1: "admin",
    ),
    UsrSetting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_selectpage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectpage,
          onTap: _navigatorPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: 'Community'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emergency), label: 'Emergency'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
