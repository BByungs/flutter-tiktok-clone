import 'package:clone/constants/gaps.dart';
import 'package:clone/features/main_navigation/stf_screen.dart';
import 'package:clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Record video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 비 활성화 된 tab은 보이지 않게끔만 처리하는 navigation 방식
          // state가 다른 tab갔다와도 그대로 유지되어 있음.
          Offstage(
            // _selectedIndex가 0이 아니라면 숨김
            offstage: _selectedIndex != 0,
            child: StfScreen(),
          ),
          Offstage(
            // _selectedIndex가 1이 아니라면 숨김
            offstage: _selectedIndex != 1,
            child: StfScreen(),
          ),
          Offstage(
            // _selectedIndex가 3이 아니라면 숨김
            offstage: _selectedIndex != 3,
            child: StfScreen(),
          ),
          Offstage(
            // _selectedIndex가 4가 아니라면 숨김
            offstage: _selectedIndex != 4,
            child: StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: PostVideoButton(),
            ),
            Gaps.h24,
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
