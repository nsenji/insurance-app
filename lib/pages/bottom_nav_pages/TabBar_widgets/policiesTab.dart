import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/styles/colors.dart';
import 'package:insurease/tools/major_font.dart';

class PoliciesTab extends StatefulWidget {
  const PoliciesTab({super.key});

  @override
  State<PoliciesTab> createState() => _PoliciesTabState();
}

class _PoliciesTabState extends State<PoliciesTab> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: MajorFont(text: 'you have no policies',weight: false,color: AppColors.blackColor,),
    );
  }
}