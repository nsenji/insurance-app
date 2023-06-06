import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
        body: Stack(children: [
          Positioned(
            top: 70,
            left: 30,
            right: 30,
            child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/welcome.png'))),
            ),
          ),
          Positioned(
            top: 500,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 13),
                    width: 250,
                    height: 17,
                    child: MajorFont(
                      text: 'PROTECT YOUR FUTURE TODAY WITH',
                      size: 14,
                      weight: false,
                      color: Colors.black87,
                    )),
                Container(
                    padding: EdgeInsets.only(left: 32),
                    width: 250,
                    height: 17,
                    child: MajorFont(
                      text: 'COMPREHENSIVE INSURANCE.',
                      size: 14,
                      weight: false,
                      color: Colors.black87,
                    )),
                SizedBox(
                  height: 14,
                ),
                Container(
                    padding: EdgeInsets.only(left: 41),
                    width: 190,
                    height: 19,
                    child: MajorFont(
                      text: 'Select your coverage.',
                      size: 14,
                      weight: false,
                      color: AppColors.primeColor,
                    )),
                SizedBox(
                  width: 200,
                  height: 100,
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
