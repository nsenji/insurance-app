import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/pages/bottom_nav_pages/myPolicies_page.dart';
import 'package:insurease/pages/bottom_nav_pages/products_page.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';
import '../../tools/button.dart';
import '../bottom_nav_pages/my_account_pages.dart';

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
    List pages = [Home(), Policies(), Profile()];
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
          unselectedLabelStyle: TextStyle(
            fontFamily: 'BubblegumSans',
            ),
          selectedLabelStyle: TextStyle(
            fontFamily: 'BubblegumSans',
            ),
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: nowIndex,
          onTap: onTap,
          elevation: 0.sp,
          showSelectedLabels:true,
          showUnselectedLabels: true,
          selectedItemColor: Color.fromARGB(193, 0, 0, 0),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(label: "Products", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "My Policies", icon: Icon(Icons.policy)),
            BottomNavigationBarItem(label: "My account", icon: Icon(Icons.person)),
          ]),
    );
  }
}
