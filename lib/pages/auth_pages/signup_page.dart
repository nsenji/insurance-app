import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';
import '../../tools/button.dart';
import '../app_pages/navBar.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  TextEditingController _usernameField = TextEditingController();
  final TextEditingController _contactField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Sign up',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 17.h, left: 17.w),
              height: 130.h,
              width: 180.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/auth.png'))),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h, left: 30.w),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2.r,
                      blurRadius: 2.r,
                      // changes position of shadow
                    ),
                  ],
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              // color: Colors.white,
              height: 450.h,
              width: 300.w,

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0.h),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _usernameField,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   //borderRadius: BorderRadius.circular(60)
                          // ),
                          label: MajorFont(
                        text: 'Name',
                        weight: false,
                        size: 15,
                      )
                          //hintText: 'username',

                          ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(17.0.h),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _emailField,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   //borderRadius: BorderRadius.circular(60)
                          // ),
                          label: MajorFont(
                        text: 'Email',
                        weight: false,
                        size: 15,
                      )
                          //hintText: 'Email',

                          ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(17.0.h),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      obscureText: true,
                      controller: _passwordField,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   //borderRadius: BorderRadius.circular(60)
                          // ),
                          label: MajorFont(
                        text: 'Password',
                        weight: false,
                        size: 15,
                      )),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(17.0.h),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _contactField,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                          text: 'Contact',
                          weight: false,
                          size: 15,
                        ),
                        hintText: 'e.g. 0xxxxxxxxx',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.h),
                    child: InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NavBar())),
                        child: Button(text: 'Sign up')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
