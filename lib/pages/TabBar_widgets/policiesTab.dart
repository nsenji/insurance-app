import 'package:flutter/material.dart';
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
            const Icon(Icons.policy,
            size: 150,
            color: AppColors.greyColor,
            ),
            const SizedBox(height: 15,),
            MajorFont(text: 'You have no policies.',weight: false,color: const Color.fromARGB(255, 189, 184, 184),),
          ],
        ),
      ),
    );
  }
}