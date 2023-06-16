// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
        title: 'InsurEase', debugShowCheckedModeBanner: false, home: Welcome());
  }
}




// [to build an apk for the different mobile architectures]
// flutter build apk --split-per-abi

// before updating the flutter version make sure you can see the version that were used in that
// current project and note them down so that you can easily revert to them once you want to work 
// on that particular project again

// [to run this project in the future when you have an updated flutter and dart version]
// run flutter downrgade
// then run flutter --version   then the dart version will also dowgrade accordingly
// 