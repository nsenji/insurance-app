import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  double width;
  double height;
  String text;
  Button({super.key, this.width = 100, this.height = 100, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/green_button.png",
              ),
              fit: BoxFit.fill
          )
        ),
        ),
      Container(
        child: 
        Center(
          child: Text(
            text,
            style:  TextStyle(
              color: Colors.white,
              fontFamily: 'BubblegumSans',
              fontSize: 12.sp
            )
            ),
        ))
    ]);
  }
}
