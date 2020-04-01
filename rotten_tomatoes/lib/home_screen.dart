import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigation.dart';
import 'Screens/movieHomeUI.dart';
import 'Screens/LoginSignUpWelcome.dart';
import 'Screens/searchUI.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool showFirst = true;
  int _selectedIndex = 0;
  final _pageOptions = [
    MovieHomeUI(),
    SearchUI(),
    LoginSignUPWelcome()
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                MyNavigator.goToHome(context);
              },
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                MyNavigator.goToLoginRegisterWelcome(context);
              },
            ),
            ListTile(
              title: Text('My PlayList'),
              onTap: () {
                MyNavigator.goToPlayList(context);
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
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
            icon: Icon(Icons.account_balance),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}