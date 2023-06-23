import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key, 
    required this.photoUrl,
    required this.radius,
    this.borderColor = Colors.black,
    this.borderWidth = 40,
    required this.onPressed,
  });
  final String photoUrl;
  final double radius;
  Color borderColor = Colors.black;
  final double borderWidth;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _borderDecoration(),
      child: InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.black12,
          backgroundImage:NetworkImage(photoUrl),
          child:Icon(Icons.camera_alt, size: radius),
        ),
      ),
    );
  }

  Decoration _borderDecoration() {
     
      return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      );
    
  }
}
