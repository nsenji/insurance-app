// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/notifiers/productType.dart';
import 'package:insurease/pages/app_pages/PlanCategories.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
import 'package:insurease/pages/app_pages/productDetails.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/pages/bottom_nav_pages/myPolicies_page.dart';
import 'package:insurease/pages/bottom_nav_pages/my_account_pages.dart';
import 'package:insurease/tools/button.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import 'api/get_products.dart';
import 'firebase_options.dart';
import 'notifiers/allPlansNotifier.dart';
import 'pages/additional Details/FireBurglary.dart';
import 'pages/additional Details/Gadget.dart';
import 'pages/additional Details/Git.dart';
import 'pages/additional Details/JobLoss.dart';
import 'pages/additional Details/Marine.dart';
import 'pages/additional Details/comprehensive.dart';
import 'pages/additional Details/creditLife.dart';
import 'pages/additional Details/health.dart';
import 'pages/additional Details/thirdParty.dart';
import 'pages/additional Details/travel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductTypeNotifier()),
      ChangeNotifierProvider(create: (context) => AllPlansNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          title: 'InsurEase',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme:
                  Typography.englishLike2018.apply(fontSizeFactor: 1.sp)),
          debugShowCheckedModeBanner: false,
          home: Welcome()),
    );
  }
}
