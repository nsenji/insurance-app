import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  String errorText = '';
  bool loading = false;
  bool passwordvisible = false;







  
  @override
  Widget build(BuildContext context) {
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
                                  controller: _emailField,
                                  decoration: InputDecoration(
                                      errorText:
                                          errorText.isEmpty ? null : errorText,
                                      floatingLabelStyle:
                                          const TextStyle(color: Colors.black),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      label: const Text('Input PF'),
                                      labelStyle:
                                          const TextStyle(color: Colors.black)
                                      // icon: Icon(Icons.lock),
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 20),
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
                                      setState(() {
                                        loading = true;
                                      });

                                      var answer =
                                          await loginPF(_emailField.text);

                                      if (answer == false) {
                                        setState(() {
                                          errorText = answer;
                                          loading = false;
                                        });
                                      } else if (answer ==
                                              'User with that PF doesnt exist' ||
                                          answer ==
                                              'Some error occurred during login' ||
                                          answer == "Provide PF or email") {
                                        setState(() {
                                          errorText = answer;
                                          loading = false;
                                        });
                                      } else if (answer is Object) {
                                        var responseData =
                                            jsonDecode(answer as String);
                                        var contact = responseData['data']
                                            ['mobile_number'];
                                      } else {
                                        setState(() {
                                          errorText = 'Submit failed';
                                          loading = false;
                                        });
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dont have an account?"),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PhoneSignupPage()));
                                },
                                child: const Text("Register",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 63, 158, 66),
                                        fontSize: 15))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
