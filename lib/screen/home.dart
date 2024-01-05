import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_market_hewan/screen/homepage.dart';
import 'package:tubes_market_hewan/screen/user.dart';
import 'package:tubes_market_hewan/style/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 3;
  final PageController controller = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuad);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: (value) => setState(() {
            _selectedIndex = value;
          }),
          children: [
            Homepage(),
            Placeholder(),
            Center(),
            User(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.searchengin),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidBell),
            label: 'Notif',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userLarge),
            label: 'User',
          ),
        ],
        // enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: navy.withOpacity(0.3),
        selectedItemColor: navy,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 20,
        onTap: _onItemTapped,
      ),
    );
  }
}
