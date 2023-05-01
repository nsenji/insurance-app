import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class MajorFont extends StatelessWidget {
  bool weight;
  final double size;
  Color color;
  final String text;

   MajorFont(
      {super.key,
      this.weight = true,
      required this.text,
      this.color = AppColors.primeColor,
      this.size = 24,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(
            color: color,
            fontFamily: 'BubblegumSans',
            fontWeight: weight?FontWeight.bold:FontWeight.normal,
            fontSize: size.sp),
    );
  }
}
