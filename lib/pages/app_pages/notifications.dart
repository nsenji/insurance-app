import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Notifications',
          color: AppColors.blackColor,
          weight: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.h, left: 65.w),
          height: 300.h,
          width: 250.w,
          child: MajorFont(
            text: 'you dont have any notifications',
            weight: false,
            size: 20,
          ),
        ),
      ),
    );
  }
}
