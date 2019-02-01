import 'package:flutter/material.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/search_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  final _pages = [
    HomePage(),
    SearchPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Insta Clon', style: TextStyle(color: Colors.black),),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('account')),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
