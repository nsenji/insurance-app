import 'package:flutter/material.dart';
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
        elevation: 0,
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.containerColor,
        title: MajorFont(
          text: 'Notifications',
          color: AppColors.blackColor,
          weight: false,
        ),
      ),
      body: Center(
        child: Padding(
        padding: const EdgeInsets.only(bottom: 140),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.notifications,
            size: 150,
            color: AppColors.greyColor,
            ),
            const SizedBox(height: 15,),
            MajorFont(text: 'You have no notifications.',weight: false,color: const Color.fromARGB(255, 189, 184, 184),),
          ],
        ),
      ),
      ),
    );
  }
}
