import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  double width;
  double height;
  String text;
  Button({super.key, this.width = 100, this.height = 37, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/green_button.png",
                  ),
                  fit: BoxFit.fill)),
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'BubblegumSans',
                    fontSize: 15)),
          ))
    ]);
  }
}
