import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/api/getUser.dart';
import 'package:insurease/pages/app_pages/app_settings.dart';
import 'package:insurease/pages/app_pages/completeProfile.dart';
import 'package:insurease/pages/app_pages/editProfile.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/button.dart';
import 'package:provider/provider.dart';

import '../../authentication/signout.dart';
import '../../notifiers/userObjectNotifier.dart';
import '../../styles/colors.dart';
import '../../tools/major_font.dart';
import '../app_pages/notifications.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    getUser(userNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'My account',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            margin: EdgeInsets.only(left: 32),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/man.png",
                        ),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 14),
                  height: 30,
                  width: 300,
                  child: MajorFont(
                    text:
                        '${userNotifier.user?.firstname} ${userNotifier.user?.lastname}',
                    size: 20,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 300,
                  child: MajorFont(
                    text: '${userNotifier.user?.email}',
                    weight: false,
                    size: 20,
                  ),
                ),
                Container(
                  width: 100,
                  height: 80,
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () async {
                        await signOut();
                        // After signing out, navigate to the login page and clear the route stack
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Welcome()),
                          (route) => false,
                        );
                      },
                      child: Button(text: 'Logout')),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 32),
              width: 300,
              height: 340,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompleteProfile())),
                    child: Container(
                      height: 45,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MajorFont(
                            text: 'Complete Profile',
                            weight: false,
                            size: 20,
                            color: AppColors.blackColor,
                          ),
                          const Icon(
                              color: AppColors.primeColor,
                              Icons.arrow_forward_sharp)
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile())),
                    child: Container(
                      height: 45,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MajorFont(
                            text: 'Edit Profile',
                            weight: false,
                            size: 20,
                            color: AppColors.blackColor,
                          ),
                          const Icon(
                              color: AppColors.primeColor,
                              Icons.arrow_forward_sharp)
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Notifications())),
                    child: Container(
                      height: 45,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MajorFont(
                            text: 'Notifications',
                            weight: false,
                            size: 20,
                            color: AppColors.blackColor,
                          ),
                          const Icon(
                              color: AppColors.primeColor,
                              Icons.arrow_forward_sharp)
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppSettings())),
                    child: SizedBox(
                      height: 45,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MajorFont(
                            text: 'App Settings',
                            weight: false,
                            size: 20,
                            color: AppColors.blackColor,
                          ),
                          const Icon(
                              color: AppColors.primeColor,
                              Icons.arrow_forward_sharp)
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
