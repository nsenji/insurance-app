import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/authentication/login.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primeColor,
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/auth.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
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
                                  BorderRadius.all(Radius.circular(20))),
                          // color: Colors.white,
                          height: 320,
                          width: 300,

                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.0),
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
                                padding: EdgeInsets.all(20.0),
                                child: TextField(
                                  style: TextStyle(color: AppColors.blackColor),
                                  controller: _passwordField,
                                  obscureText: passwordvisible ? false : true,
                                  decoration: InputDecoration(
                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                                      label: MajorFont(
                                        text: 'Password',
                                        weight: false,
                                        size: 15,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          if (passwordvisible == true) {
                                            setState(() {
                                              passwordvisible = false;
                                            });
                                          } else {
                                            setState(() {
                                              passwordvisible = true;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          passwordvisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: AppColors.primeColor,
                                          size: 15,
                                        ),
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 38),
                                child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      bool shouldNavigate = await logIn(
                                          _emailField.text.trim(),
                                          _passwordField.text.trim());

                                      if (shouldNavigate) {
                                        setState(() {
                                          loading = false;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NavBar()));
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        setState(() {
                                          shownotification();
                                        });
                                      }
                                    },
                                    child: Button(text: 'Login')),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
