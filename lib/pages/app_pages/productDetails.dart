import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/app_pages/moreDetails.dart';
import 'package:insurease/styles/colors.dart';

import '../../tools/button.dart';
import '../../tools/major_font.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'AXA PRADO 1',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 20.h),
              height: 175.h,
              width: 250.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/axa-logo.png'))),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 35.w),
              height: 160.h,
              width: 310.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          MajorFont(
                            text: 'Premium type',
                            size: 20,
                            weight: false,
                          ),
                          // SizedBox(
                          //   height: 4.h,
                          // ),
                          MajorFont(
                            text: 'Fixed',
                            size: 20,
                            weight: false,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 57.h,
                      ),
                      Column(
                        children: [
                          MajorFont(
                            text: 'Premium rate',
                            size: 20,
                            weight: false,
                          ),
                          // SizedBox(
                          //   height: 4.h,
                          // ),
                          MajorFont(
                            text: '20000',
                            size: 20,
                            weight: false,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          MajorFont(
                            text: 'Insurance type',
                            size: 20,
                            weight: false,
                          ),
                          // SizedBox(
                          //   height: 4.h,
                          // ),
                          MajorFont(
                            text: 'Life',
                            size: 20,
                            weight: false,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 57.h,
                      ),
                      Column(
                        children: [
                          MajorFont(
                            text: 'Cover duration',
                            size: 20,
                            weight: false,
                          ),
                          // SizedBox(
                          //   height: 4.h,
                          // ),
                          MajorFont(
                            text: '2',
                            size: 20,
                            weight: false,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MoreDetails())),
              child: Button(
                text: 'Purchase',
              ),
            )
          ],
        ),
      ),
    );
  }
}
