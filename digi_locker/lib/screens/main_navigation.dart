import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'issued_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Search Screen (Mock)", style: TextStyle(fontSize: 18))),
    const IssuedScreen(),
    const Center(child: Text("Menu Screen (Mock)", style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF3F3DDF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.verified_outlined), label: "Issued"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Menu"),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("UMANG Service Clicked (Mock)")),
          );
        },
        backgroundColor: Colors.orange,
        label: const Text("UMANG", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.touch_app, color: Colors.white),
      ),
    );
  }
}