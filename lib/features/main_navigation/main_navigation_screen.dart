import 'package:clone/features/main_navigation/stf_screen.dart';
import 'package:clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final screens = [
    // 각자 key를 부여하면 각 화면을 서로 다른 widget인것처럼 렌더링 함
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
    Container(),
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
    // Center(
    //   child: Text('Home'),
    // ),
    // Center(
    //   child: Text('Search'),
    // ),
    // Center(
    //   child: Text('Search'),
    // ),
    // Center(
    //   child: Text('Search'),
    // ),
    // Center(
    //   child: Text('Search'),
    // ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens[_selectedIndex],
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: 'Home',
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
              selectedIcon: FontAwesomeIcons.house,
            ),
            NavTab(
              text: 'Discover',
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.compass,
              onTap: () => _onTap(1),
              selectedIcon: FontAwesomeIcons.solidCompass,
            ),
            NavTab(
              text: 'Inbox',
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.message,
              onTap: () => _onTap(3),
              selectedIcon: FontAwesomeIcons.solidMessage,
            ),
            NavTab(
              text: 'Profile',
              isSelected: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
              selectedIcon: FontAwesomeIcons.solidUser,
            ),
          ],
        ),
      ),
    );
  }
}
