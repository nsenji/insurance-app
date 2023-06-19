import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child:Padding(
        padding: const EdgeInsets.only(bottom: 140),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.policy,
            size: 150,
            color: AppColors.greyColor,
            ),
            SizedBox(height: 15,),
            MajorFont(text: 'You have no policies.',weight: false,color: Color.fromARGB(255, 189, 184, 184),),
          ],
        ),
      ),
    );
  }
}