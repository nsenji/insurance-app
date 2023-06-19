import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/styles/colors.dart';
import 'package:insurease/tools/major_font.dart';

class ClaimsTab extends StatefulWidget {
  const ClaimsTab({super.key});

  @override
  State<ClaimsTab> createState() => _ClaimsTabState();
}

class _ClaimsTabState extends State<ClaimsTab> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: MajorFont(text: 'you have no claims',weight: false,color: AppColors.blackColor,),
    );
  }
}