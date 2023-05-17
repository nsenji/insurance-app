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
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Settings',
          color: AppColors.blackColor,
          weight: false,
        ),
      ),
      body: Center(
        child: MajorFont(text: 'This is going to be the app settings page'),
      ),
    );
  }
}
