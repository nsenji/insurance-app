import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  State<Policies> createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'My policies',
          color: AppColors.blackColor,
          weight: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 65),
          height: 300,
          width: 250,
          child: MajorFont(
            text: 'you dont have any policies',
            weight: false,
            size: 20,
          ),
        ),
      ),
    );
  }
}
