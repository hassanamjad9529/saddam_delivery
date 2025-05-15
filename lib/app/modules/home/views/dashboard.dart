import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/app/modules/home/views/home.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';
import 'package:getx_standard/utils/constants.dart';

class SaddamBottomNav extends StatefulWidget {
  const SaddamBottomNav({super.key});

  @override
  State<SaddamBottomNav> createState() => _SaddamBottomNavState();
}

class _SaddamBottomNavState extends State<SaddamBottomNav> {
  int _selectedIndex = 1; // Home selected by default

  final List<Widget> _screens = [
    const Center(child: Text("Wallet Screen")),
    const DashboardScreen(), // This is your Home tab screen
    const Center(child: Text("Profile Screen 1")),
    const Center(child: Text("Profile Screen 2")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color get selectedColor => LightThemeColors.primaryColorBlue;
  Color get unselectedColor => const Color(0xFFd7dce3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            enableFeedback: false,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: selectedColor,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: unselectedColor,
            ),
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  DashboardImages.walletbottomPng,
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 0 ? selectedColor : unselectedColor,
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  DashboardImages.homeBottomPng,
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 1 ? selectedColor : unselectedColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  DashboardImages.profileBottomPng,
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 2 ? selectedColor : unselectedColor,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  DashboardImages.profileBottomPng,
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 3 ? selectedColor : unselectedColor,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
