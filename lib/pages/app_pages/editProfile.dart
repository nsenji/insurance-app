import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import '../../authentication/getUser.dart';
import '../../authentication/updateProfile.dart';
import '../../notifiers/userObjectNotifier.dart';
import '../../styles/colors.dart';
import '../../tools/button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();

  deleteUser() async {
    var user = FirebaseAuth.instance.currentUser;
    await user?.delete();
  }

  var changedfirst = false;
  var changedlast = false;
  var changedemail = false;

  bool loading = false;
  shownotification() {
    Fluttertoast.showToast(
        backgroundColor: AppColors.primeColor,
        textColor: AppColors.whiteColor,
        msg: 'Update Failed',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  bool passwordvisible = false;
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: true);
  
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Edit Profile',
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
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/images/placeholder.png",
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                  onTap: () {},
                                  child: MajorFont(
                                    text: 'Edit Image',
                                    weight: false,
                                    size: 20,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
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
                            color: AppColors.whiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        // color: Colorshite,

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20, bottom: 14),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    changedfirst = true;
                                  });
                                },
                                style: const TextStyle(color: AppColors.blackColor),
                                controller: _firstname,
                                decoration: InputDecoration(
                                  // border: OutlineInputBorder(
                                  //   //borderRadius: BorderRadius.circular(60)
                                  // ),
                                  label: MajorFont(
                                    text: 'First Name',
                                    weight: false,
                                    size: 15,
                                  ),
                                  helperText: userNotifier.user.firstname,
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 14, left: 20, right: 20, bottom: 14),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    changedlast = true;
                                  });
                                },
                                style: const TextStyle(color: AppColors.blackColor),
                                controller: _lastname,
                                decoration: InputDecoration(
                                  // border: OutlineInputBorder(
                                  //   //borderRadius: BorderRadius.circular(60)
                                  // ),
                                  label: MajorFont(
                                    text: 'Last Name',
                                    weight: false,
                                    size: 15,
                                  ),
                                  helperText: userNotifier.user.lastname,
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 14, left: 20, right: 20, bottom: 14),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    changedemail = true;
                                  });
                                },
                                style: const TextStyle(color: AppColors.blackColor),
                                controller: _email,
                                decoration: InputDecoration(
                                  // border: OutlineInputBorder(
                                  //   //borderRadius: BorderRadius.circular(60)
                                  // ),
                                  label: MajorFont(
                                    text: 'Email',
                                    weight: false,
                                    size: 15,
                                  ),
                                  helperText: userNotifier.user.email,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    
                                    bool shouldNavigate = await updateProfile(userNotifier,
                                        _firstname.text,
                                        _lastname.text,
                                        _email.text);

                                    if (shouldNavigate) {
                                      setState(() {
                                        loading = false;
                                      });
                                    } else {
                                      setState(() {
                                        loading = false;
                                      });
                                      setState(() {
                                        shownotification();
                                      });
                                    }
                                  },
                                  child: Button(
                                      text:
                                          'Update')), // inactive if form empty
                            ),
                            const Padding(
                              padding: EdgeInsets.all(25.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            deleteUser();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Welcome()),
                              (route) => false,
                            );
                          },
                          child: (MajorFont(
                            text: 'Delete Account',
                            weight: false,
                            color: Colors.red,
                            size: 20,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
