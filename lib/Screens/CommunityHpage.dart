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

  void _navigatorPage(int index ) {
    setState(() {
      _selectpage = index;
    });
  }
  final List<Widget> Pages =[
    PostomePage(),
    AddPost(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_selectpage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectpage,
          onTap: _navigatorPage,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'add'),
      ]),
    );
  }
}
