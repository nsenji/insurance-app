import 'package:flutter/material.dart';
import 'package:insurease/pages/bottom_nav_pages/myPolicies_page.dart';
import 'package:insurease/pages/bottom_nav_pages/products_page.dart';

import '../../styles/colors.dart';
import 'my_account_pages.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int nowIndex = 0;
  void onTap(int index) {
    setState(() {
      nowIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [const Home(), const Policies(), const Profile()];
    return Scaffold(
      //   appBar: AppBar(
      //   elevation: 1,
      //   backgroundColor: AppColors.primeColor,
      //   title: MajorFont(
      //     text: 'Welcome [username]',
      //     color: AppColors.whiteColor,
      //     weight: false,
      //   ),
      //   leading: IconButton(
      //       color: AppColors.whiteColor,
      //       onPressed: () => Navigator.pop(context),
      //       icon: const Icon(Icons.arrow_back)),
      // ),

      body: pages[nowIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'BubblegumSans',
            ),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'BubblegumSans',
            ),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: nowIndex,
          onTap: onTap,
          elevation: 0,
          showSelectedLabels:true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primeColor,
          unselectedItemColor: const Color.fromARGB(255, 51, 49, 49).withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(label: "Products", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "My Policies", icon: Icon(Icons.policy)),
            BottomNavigationBarItem(label: "My account", icon: Icon(Icons.person)),
          ]),
    );
  }
}
