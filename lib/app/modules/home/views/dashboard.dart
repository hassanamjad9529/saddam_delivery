import 'package:flutter/material.dart';
import 'package:getx_standard/app/modules/home/views/home.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.blue,
            ),
            label: 'Wallet',
            
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
