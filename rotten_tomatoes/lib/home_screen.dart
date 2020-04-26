import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Screens/root_page.dart';
import 'package:rotten_tomatoes/Services/auth.dart';
import 'Screens/movieHomeUI.dart';
import 'Screens/searchUI.dart';
import 'Screens/playListPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool showFirst = true;
  int _selectedIndex = 0;
  final _pageOptions = [
    MovieHomeUI(),
    Search(),
    PlayListView(),
    RootPage(auth: new Auth()),
  ];

  @override
  void initState() {
    super.initState();

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black26,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            title: Text('PlayList'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('User'),
          ),
        ],
      ),
    );
  }
}