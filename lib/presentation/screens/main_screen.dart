import 'package:cat_breed_app/presentation/screens/activity_screen.dart';
import 'package:cat_breed_app/presentation/screens/home_screen.dart';
import 'package:cat_breed_app/presentation/screens/upload_screen.dart';
import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  // int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _screens = [
    const HomeScreen(),
    const UploadScreen(),
    const ActivityScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Padding(padding: EdgeInsets.all(3.0), child: Icon(Icons.home)),
          Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(Icons.cloud_upload_rounded)),
          Padding(
              padding: EdgeInsets.all(3.0), child: Icon(Icons.local_activity)),
        ],
        color: ColorManager.primary,
        buttonBackgroundColor: ColorManager.primary,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
