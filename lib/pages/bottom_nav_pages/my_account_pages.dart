import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/app_pages/app_settings.dart';
import 'package:insurease/pages/app_pages/editProfile.dart';
import 'package:insurease/tools/button.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
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
            width: 300.w,
            margin: EdgeInsets.only(left: 32.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "assets/images/man.jpg",
                        ),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 14.h),
                  height: 30.h,
                  width: 300.w,
                  child: MajorFont(
                    text: 'Thomas Jerry',
                    size: 20,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 300.w,
                  child: MajorFont(
                    text: 'thomasjerry@gmail.com',
                    weight: false,
                    size: 20,
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 80.h,
                  alignment: Alignment.center,
                  child: Button(text: 'Logout'),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 32.w),
              width: 300.w,
              height: 340.h,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile())),
                    child: Container(
                      height: 45.h,
                      width: 300.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MajorFont(
                            text: 'Edit profile',
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
                    thickness: 1.h,
                    color: AppColors.greyColor,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Notifications())),
                    child: Container(
                      height: 45.h,
                      width: 300.w,
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
                    thickness: 1.h,
                    color: AppColors.greyColor,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AppSettings())),
                    child: SizedBox(
                      height: 45.h,
                      width: 300.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MajorFont(
                            text: 'App settings',
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
                    thickness: 1.h,
                    color: AppColors.greyColor,
                  ),
                  // Container(
                  //   height: 45.h,
                  //   width: 300.w,
                  //   color: Colors.blue,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       MajorFont(
                  //         text: 'P',
                  //         weight: false,
                  //         size: 20,
                  //       ),
                  //       Icon(
                  //         color : AppColors.primeColor,
                  //         Icons.arrow_forward_sharp)
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   thickness: 1,
                  //   color: AppColors.greyColor,
                  // ),
                  // Container(
                  //   height: 45.h,
                  //   width: 300.w,
                  //   color: Colors.blue,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       MajorFont(
                  //         text: 'Profile settings',
                  //         weight: false,
                  //         size: 20,
                  //       ),
                  //       Icon(
                  //         color : AppColors.primeColor,
                  //         Icons.arrow_forward_sharp)
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   thickness: 1,
                  //   color: AppColors.greyColor,
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
