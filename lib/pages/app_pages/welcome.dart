import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/auth_pages/login_page.dart';
import 'package:insurease/pages/auth_pages/signup_page.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';
import '../../tools/button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
          Positioned(
            top: 70.h,
            left: 30.w,
            right: 30.w,
            child: Container(
              height: 400.h,
              width: 300.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/welcome.png')
                )
              ),
            ),
          ),
          Positioned(
            top: 500.h,
            left: 30.w,
            right: 30.w,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 13.w),
                    width: 250.w,
                    height: 17.h,
                    child: MajorFont(
                      text: 'PROTECT YOUR FUTURE TODAY WITH',
                      size: 14,
                      weight: false,
                      color: Colors.black87,
                    )),
                Container(
                    padding: EdgeInsets.only(left: 32.w),
                    width: 250.w,
                    height: 17.h,
                    child: MajorFont(
                      text: 'COMPREHENSIVE INSURANCE.',
                      size: 14,
                      weight: false,
                      color: Colors.black87,
                    )),
                SizedBox(height: 13.h,),
                Container(
                    padding: EdgeInsets.only(left: 41.w),
                    width: 190.w,
                    height: 15.h,
                    child: MajorFont(
                      text: 'Select your coverage.',
                      size: 14,
                      weight: false,
                      color: AppColors.primeColor,
                    )),
                Container(
                  width: 200.w,
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())),
                          child: Button(
                            text: 'Login',
                            width: 95,
                            height: 37,
                          )),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage())),
                        child: Button(
                          text: 'Sign up',
                          width: 95,
                          height: 37,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
