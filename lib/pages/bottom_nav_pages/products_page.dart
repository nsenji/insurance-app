import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';
import '../../tools/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.primeColor,
        title: MajorFont(
          text: 'Welcome [username]',
          color: AppColors.whiteColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.whiteColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,top: 10),
            child: MajorFont(text: 'Products',weight: false,size: 18,color: AppColors.blackColor,),
          )
        ],
      ),
    );
  }
}
