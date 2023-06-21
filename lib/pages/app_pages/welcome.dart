import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcome.png'),
            const SizedBox(
              height: 20,
            ),
            MajorFont(
              text: 'PROTECT YOUR FUTURE TODAY WITH',
              size: 14,
              weight: false,
              color: Colors.black87,
            ),
            MajorFont(
              text: 'COMPREHENSIVE INSURANCE.',
              size: 14,
              weight: false,
              color: Colors.black87,
            ),
            const SizedBox(
              height: 14,
            ),
            MajorFont(
              text: 'Select your coverage.',
              size: 14,
              weight: false,
              color: AppColors.primeColor,
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage())),
                      child: Button(
                        text: 'Login',
                        width: 95,
                        height: 37,
                      )),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignupPage())),
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
    );
  }
}
