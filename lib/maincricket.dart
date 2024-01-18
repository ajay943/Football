import 'package:app/views/detail_page.dart';
import 'package:app/views/home_page.dart';
import 'package:app/views/myMatches.dart';
import 'package:app/views/sidenavbar.dart';
import 'package:app/views/walletNavbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const SidebarXExampleApp(),
    const MyMatches(),
    const WalletNavbarScreen(),
    const SideNavbar(),
  ];
  final List<String> _labels = ["Home", "My Matches", "Wallet", "Menu"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
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
              _pages.length,
              (index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      index == 0
                          ? FontAwesomeIcons.home
                          : index == 1
                              ? FontAwesomeIcons.newspaper
                              : index == 2
                                  ? FontAwesomeIcons.wallet
                                  : FontAwesomeIcons.navicon,
                      color:
                          _selectedIndex == index ? Colors.white : Colors.grey,
                      size: _selectedIndex == index ? 25 : 22,
                    ),
                    onPressed: () {
                      _onNavigationTap(index);
                    },
                  ),
                  Text(
                    _labels[index],
                    style: TextStyle(
                      color:
                          _selectedIndex == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onNavigationTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
