import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/notifiers/allPlansNotifier.dart';
import 'package:insurease/pages/additional%20Details/creditLife.dart';
import 'package:insurease/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../tools/button.dart';
import '../../tools/major_font.dart';

class ProductDetails extends StatefulWidget {
  dynamic planIndex;
  dynamic category;

  ProductDetails({super.key, required this.planIndex, required this.category});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    dynamic plans = Provider.of<AllPlansNotifier>(context, listen: false)
        .plansList[widget.planIndex];
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Details',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          height: 900.h,
          width: 360.w,
          // color: Colors.blue,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.h),
                height: 100.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyColor),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage('${plans.logoUrl}'))),
              ),
              Container(
                width: 320.w,
                height: 50.h,
                // color: Colors.yellow,
                child: Center(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MajorFont(
                    text: '${plans.title}',
                    color: AppColors.blackColor,
                  ),
                )),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.h),
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                width: 320.w,
                height: 200.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2.r,
                        blurRadius: 2.r,
                        // changes position of shadow
                      ),
                    ],
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.all(Radius.circular(9.r))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.w),
                      height: 180.h,
                      width: 140.w,
                      // color: Colors.cyan,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MajorFont(
                            text: 'Category',
                            weight: false,
                            size: 17,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: 'Code',
                            weight: false,
                            size: 17,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: 'Insurer',
                            weight: false,
                            size: 17,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: 'Premium rate',
                            weight: false,
                            size: 17,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: 'Premium type',
                            weight: false,
                            size: 17,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: 'Duration (months)',
                            weight: false,
                            size: 17,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8.w),
                      height: 180.h,
                      width: 140.w,
                      // color: Colors.pink,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MajorFont(
                            text: '${widget.category}',
                            weight: false,
                            size: 16,
                            color: AppColors.blackColor,
                            flowover: true,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: '${plans.code}',
                            weight: false,
                            size: 16,
                            color: AppColors.blackColor,
                            flowover: true,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: '${plans.insurer}',
                            weight: false,
                            size: 16,
                            color: AppColors.blackColor,
                            flowover: true,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: '${plans.premiumRate}',
                            weight: false,
                            size: 16,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: '${plans.premiumType}',
                            weight: false,
                            size: 16,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MajorFont(
                            text: '${plans.coverDuration}',
                            weight: false,
                            size: 16,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                width: 320.w,
                height: 200.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2.r,
                        blurRadius: 2.r,
                        // changes position of shadow
                      ),
                    ],
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.all(Radius.circular(9.r))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.w, top: 8.h),
                      height: 30.h,
                      width: 320.w,
                      child: MajorFont(
                        text: 'Description',
                        weight: false,
                        size: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      width: 290.w,
                      height: 170.h,
                      // color: Colors.orange,
                      child: SingleChildScrollView(
                        child: Wrap(children: [
                          MajorFont(
                            text: '${plans.description}',
                            size: 17,
                            color: AppColors.blackColor,
                            weight: false,
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
