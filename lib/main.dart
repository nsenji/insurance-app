// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/notifiers/productType.dart';

import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
import 'package:insurease/styles/colors.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'notifiers/allPlansNotifier.dart';
import 'notifiers/userObjectNotifier.dart';
import 'pages/bottom_nav_pages/my_account_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductTypeNotifier()),
      ChangeNotifierProvider(create: (context) => AllPlansNotifier()),
      ChangeNotifierProvider(create: (context) => UserNotifier()),
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

              // primarySwatch: Colors.blue,
              textTheme:
                  Typography.englishLike2018.apply(fontSizeFactor: 1.sp)),
          debugShowCheckedModeBanner: false,
          home: Welcome()),
    );
  }
}

// flutter build apk --split-per-abi