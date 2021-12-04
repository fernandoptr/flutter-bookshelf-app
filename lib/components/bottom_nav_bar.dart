import 'package:bookshelf_app/screens/account_screen.dart';
import 'package:bookshelf_app/screens/bookshelf_screen.dart';
import 'package:bookshelf_app/screens/explore_screen.dart';
import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _screens = [
    BookshelfScreen(),
    const ExploreScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
    );
  }

  Widget customBottomNav() {
    return BottomNavigationBar(
      selectedItemColor: BookShelfTheme.ink01,
      unselectedItemColor: BookShelfTheme.ink03,
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/bookshelf-icon.png',
            width: 30,
            color: _selectedIndex == 0
                ? BookShelfTheme.ink01
                : BookShelfTheme.ink03,
          ),
          label: 'Bookshelf',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/explore-icon.png',
            width: 30,
            color: _selectedIndex == 1
                ? BookShelfTheme.ink01
                : BookShelfTheme.ink03,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/user-icon.png',
            width: 30,
            color: _selectedIndex == 2
                ? BookShelfTheme.ink01
                : BookShelfTheme.ink03,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
