import 'package:flutter/material.dart';

import 'package:fluttertui_app/view/pages/auth_page.dart';
import 'package:fluttertui_app/view/pages/qea_page.dart';
import 'package:fluttertui_app/view/pages/mea_page.dart';
import 'package:fluttertui_app/view/pages/sea_page.dart';
import 'package:fluttertui_app/view/pages/es_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget _currentPage = AuthPage();

  static const List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(
      title: Text('Auth Page'),
      icon: Icon(Icons.build),
    ),
    BottomNavigationBarItem(
      title: Text('QEA Page'),
      icon: Icon(Icons.ac_unit_sharp),
    ),
    BottomNavigationBarItem(
      title: Text('MEA Page'),
      icon: Icon(Icons.ac_unit_sharp),
    ),
    BottomNavigationBarItem(
      title: Text('SEA Page'),
      icon: Icon(Icons.ac_unit_sharp),
    ),
    BottomNavigationBarItem(
      title: Text('Expert System Page'),
      icon: Icon(Icons.ac_unit_sharp),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentPage = AuthPage();
          break;
        case 1:
          _currentPage = QeaPage();
          break;
        case 2:
          _currentPage = MeaPage();
          break;
        case 3:
          _currentPage = SeaPage();
          break;
        case 4:
          _currentPage = EsPage();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationBarItems,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: _currentPage);
  }
}
