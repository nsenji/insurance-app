import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  Future loadData() async {
    // await Future.delayed(Duration(seconds: 6));
    ProductTypeNotifier productType =
        Provider.of<ProductTypeNotifier>(context, listen: false);
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    UserByID userByID = Provider.of<UserByID>(context, listen: false);
    await userByID.userById;
    await getProductTypes(productType);
    await getUser(userNotifier, userByID);
  }

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
                backgroundColor: AppColors.greyColor,
                color: AppColors.primeColor,
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
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
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                                    label: MajorFont(
                                      text: 'Phone number',
                                      weight: false,
                                      size: 15,
                                    ),
                                    // icon: Icon(Icons.lock),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                             
                              Container(
                                padding: const EdgeInsets.only(top: 38),
                                child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      // bool shouldNavigate = await (
                                      //     _emailField.text
                                      //     );

                                      // await loadData();

                                      // if (shouldNavigate) {
                                      //   Navigator.pushAndRemoveUntil(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               const NavBar()),
                                      //       ((route) => false));
                                      // } else {
                                      //   setState(() {
                                      //     loading = false;
                                      //   });
                                      //   setState(() {
                                      //     shownotification();
                                      //   });
                                      // }
                                    },
                                    child: Button(text: 'Login')),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(25.0),
                              ),
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
