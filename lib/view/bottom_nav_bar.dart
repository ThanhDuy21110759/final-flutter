import 'package:coffee_ui/view/profile/profile_page.dart';
import 'package:coffee_ui/view/receipt/receipt_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffee_ui/view/homepage/home_page.dart';
import 'package:flutter/material.dart';

import 'cart/cart_page.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, required this.initialIndex});
  static const String routeName = '/home';

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Receipt(),
    Cart(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Opacity(
              opacity: _selectedIndex == 0 ? 1 : 0.5,
              child: SvgPicture.asset('assets/images/home.svg'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Opacity(
              opacity: _selectedIndex == 1 ? 1 : 0.5,
              child: SvgPicture.asset('assets/images/receipt.svg'),
            ),
            label: 'Receipt',
          ),
          BottomNavigationBarItem(
            icon: Opacity(
              opacity: _selectedIndex == 2 ? 1 : 0.5,
              child: SvgPicture.asset('assets/images/cart.svg'),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Opacity(
              opacity: _selectedIndex == 3 ? 1 : 0.5,
              child: SvgPicture.asset('assets/images/profile.svg'),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}