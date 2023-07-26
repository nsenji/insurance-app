import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/Phone_auth/OTP_provider.dart';
import 'package:insurease/Phone_auth/page_phoneSignup.dart';
import 'package:insurease/Phone_auth/yes_page.dart';
import 'package:insurease/authentication/login.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import '../../Firebase_paths/user_by_ID.dart';
import '../../api/get_products.dart';
import '../../authentication/getUser.dart';
import '../../notifiers/productType.dart';
import '../../notifiers/userObjectNotifier.dart';
import '../../styles/colors.dart';
import '../../tools/button.dart';
import 'api_phone/checkNumber.dart';
import 'api_phone/checkPF.dart';

class OtpInput extends StatefulWidget {
  final String id;
  const OtpInput({super.key, required this.id});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final TextEditingController _OTPField = TextEditingController();
  String errorText = '';

  bool loading = false;
  shownotification() {
    Fluttertoast.showToast(
        backgroundColor: AppColors.primeColor,
        textColor: AppColors.whiteColor,
        msg: 'Login Failed',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  bool passwordvisible = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: '',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.whiteColor,
      body: loading
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: AppColors.greyColor,
                    color: AppColors.primeColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Verifying Phone Number')
                ],
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 150, left: 30, right: 30, bottom: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  // changes position of shadow
                                ),
                              ],
                              color: AppColors.containerColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          // color: Colors.white,

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  style: const TextStyle(
                                      color: AppColors.blackColor),
                                  controller: _OTPField,
                                  decoration: InputDecoration(
                                      errorText:
                                          errorText.isEmpty ? null : errorText,
                                      floatingLabelStyle:
                                          const TextStyle(color: Colors.black),
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                                      label: const Text('Input OTP'),
                                      labelStyle:
                                          const TextStyle(color: Colors.black)
                                      // icon: Icon(Icons.lock),
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 38),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .green, // Change the text color here
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Optional: Customize the button's shape
                                      ),
                                    ),
                                    onPressed: () async {
                                      // Create a PhoneAuthCredential with the code
                                      PhoneAuthCredential credential =
                                          PhoneAuthProvider.credential(
                                              verificationId: widget.id,
                                              smsCode: _OTPField.text);

                                      // Sign the user in (or link) with the credential
                                      UserCredential userCredential = await auth
                                          .signInWithCredential(credential);

                                      if (userCredential.user == null) {
                                        setState(() {
                                          errorText = 'Invalid OTP';
                                        });
                                      } else {
                                        print(
                                            'yessssssssssssssssssssssssssssssssssssssss');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Yes()));
                                      }
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text('Submit'),
                                    )),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
