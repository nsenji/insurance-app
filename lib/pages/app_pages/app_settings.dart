import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/styles/colors.dart';
import 'package:insurease/tools/major_font.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
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
          text: 'Settings',
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
            Icon(Icons.settings,
            size: 150,
            color: AppColors.greyColor,
            ),
            SizedBox(height: 15,),
            MajorFont(text: 'Coming soon...',weight: false,color: Color.fromARGB(255, 189, 184, 184),),
          ],
        ),
      ),
      ),
    );
  }
}
