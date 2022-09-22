import 'package:flutter/material.dart';
import 'package:flutter_app_spotify/pages/screen/home_page.dart';
import 'package:flutter_app_spotify/pages/screen/library_page.dart';
import 'package:flutter_app_spotify/pages/screen/search_page.dart';
import 'package:flutter_app_spotify/pages/screen/setting_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../theme/colors.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final List<Widget> listPage = [
    HomePage(),
    LibraryPage(),
    SearchPage(),
    SettingPage(),
  ];

  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[indexPage],
      backgroundColor: black,
      bottomNavigationBar: Container(
        color: black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            backgroundColor: black,
            color: white,
            activeColor: primary,
            tabBackgroundColor: bgrey,
            gap: 8,
            onTabChange: (index){
              setState(() {
                indexPage = index;
              });
            },
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.library_music,
                text: 'Library',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ]
          ),
        ),
      ),
    );
  }
}

