// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/tools/button.dart';
import 'package:insurease/tools/major_font.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>MaterialApp(
        title: 'InsurEase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Typography.englishLike2018.apply(fontSizeFactor : 1.sp)
        ),
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
            body: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                MajorFont(text: 'this should work just fine',size: 22,weight: false),
                Container(
                  height: 30.h,
                  width: 60.w,
                  child: Button(text: 'Next'),
                )
                ],
                )
        )
      ),
    );
  }
}

