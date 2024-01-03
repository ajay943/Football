

import 'package:app/views/leage_page.dart';
import 'package:app/views/home_page.dart';
import 'package:app/views/sidenavbar.dart';
import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final dynamic _pages = [
    const SideNavbar(),
    const WalletScreen(),
    const LeagePage(),
    const SidebarXExampleApp(),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF8443BA),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4, // Number of icons
            (index) => IconButton(
              icon: Icon(
                index == 0
                    ? FontAwesomeIcons.futbol
                    : index == 1
                        ? FontAwesomeIcons.newspaper
                        : index == 2
                            ? FontAwesomeIcons.wallet
                            : FontAwesomeIcons.navicon,
                color: _selectedIndex == index
                    ? Colors.white
                    : Colors.grey,
                size: _selectedIndex == index ? 30 : 25,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
