import 'package:app/views/about_page.dart';
import 'package:app/views/home_page.dart';
import 'package:app/views/leage_page.dart';
import 'package:app/views/news_page.dart';
import 'package:app/views/table_page.dart';
import 'package:app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final dynamic _pages = [
    const AboutPage(),
    const LeagePage(),
    const SidebarXExampleApp(),    
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(size: 25),
        unselectedIconTheme: const IconThemeData(size: 25),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.futbol), 
              label: "About Us "),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tableList),
            label: 'League Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.basketball),
            label: 'Games',
          ),
        ].reversed.toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
