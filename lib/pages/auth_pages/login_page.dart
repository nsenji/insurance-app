import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/app_pages/navBar.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import '../../api/get_products.dart';
import '../../notifiers/productType.dart';
import '../../styles/colors.dart';
import '../../tools/button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Login',
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
              margin: EdgeInsets.only(top: 20.h, left: 17.w),
              height: 130.h,
              width: 180.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/auth.png'))),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40.h, left: 30.w, top: 30.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2.r),
                      spreadRadius: 2.r,
                      blurRadius: 2.r,
                      // changes position of shadow
                    ),
                  ],
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              // color: Colors.white,
              height: 320.h,
              width: 300.w,

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0.h),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _emailField,
                      obscureText: false,
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                        label: MajorFont(
                          text: 'Email',
                          weight: false,
                          size: 15,
                        ),
                        // icon: Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0.h),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _passwordField,
                      obscureText: true,
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                        label: MajorFont(
                          text: 'Password',
                          weight: false,
                          size: 15,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 38.h),
                    child: InkWell(
                        onTap: () {
                          ProductTypeNotifier productType =
                              Provider.of<ProductTypeNotifier>(context,
                                  listen: false);
                          getProductTypes(productType);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavBar()));
                        },
                        child: Button(text: 'Login')),
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
