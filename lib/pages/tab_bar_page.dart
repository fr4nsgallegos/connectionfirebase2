import 'package:conectionfirebase2/pages/create_page.dart';
import 'package:conectionfirebase2/pages/home_page.dart';
import 'package:conectionfirebase2/pages/stream_page.dart';
import 'package:conectionfirebase2/utils/tab_amap.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _activePageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _pages = [
    HomePage(bgColor: Colors.red),
    CreatePage(
      bgColor: Colors.red,
    ),
    StreamPage(bgColor: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageDetails[_activePageIndex]["title"]),
        backgroundColor: pageDetails[_activePageIndex]['navigationBarColor'],
      ),
      body: pageDetails[_activePageIndex]['pageName'],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: pageDetails[_activePageIndex]['navigationBarColor'],
        buttonBackgroundColor: pageDetails[_activePageIndex]['botton_color'],
        items: [
          Icon(Icons.home),
          Icon(Icons.person),
          Icon(Icons.settings),
        ],
        onTap: (index) {
          _activePageIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
