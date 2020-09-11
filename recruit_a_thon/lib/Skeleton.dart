import 'package:recruitathon/External/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:recruitathon/Home/homeScreen.dart';
import 'package:recruitathon/CandidateProfile/candidateProfile.dart';
import 'package:recruitathon/Settings/Settings.dart';

class Skeleton extends StatefulWidget {
  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int _page = 0;

  List<Widget> _allPages = [
    HomeScreen(),
    Settings(),//change with status
    CandidateProfile(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _allPages[_page],
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home",),
            TabData(iconData: Icons.bookmark_border, title: "Status"),
            TabData(iconData: Icons.face, title: "Profile"),
            TabData(iconData: Icons.settings, title: "Settings"),
          ],
          onTabChangedListener: (int index){
            setState(() {
              _page = index;
            });
          },
          barBackgroundColor: Theme.of(context).bottomAppBarColor,
          inactiveIconColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
