import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/notifiers/allPlansNotifier.dart';
import 'package:insurease/notifiers/userObjectNotifier.dart';
import 'package:insurease/pages/additional%20Details/creditLife.dart';
import 'package:insurease/pages/app_pages/completeProfile.dart';
import 'package:insurease/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../api/getUser.dart';
import '../../tools/button.dart';
import '../../tools/major_font.dart';
import '../additional Details/FireBurglary.dart';
import '../additional Details/Gadget.dart';
import '../additional Details/Git.dart';
import '../additional Details/JobLoss.dart';
import '../additional Details/Marine.dart';
import '../additional Details/comingSoon.dart';
import '../additional Details/comprehensive.dart';
import '../additional Details/health.dart';
import '../additional Details/thirdParty.dart';
import '../additional Details/travel.dart';

class ProductDetails extends StatefulWidget {
  dynamic planIndex;
  dynamic category;

  ProductDetails({super.key, required this.planIndex, required this.category});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void initState() {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    getUser(userNotifier);
    super.initState();
  }

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
          height: 785.h,
          width: 360.w,
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
                        image: Provider.of<AllPlansNotifier>(context,
                                        listen: false)
                                    .plansList[widget.planIndex]
                                    .insurer ==
                                'Tangerine'
                            ? AssetImage('assets/images/tangerine-logo.png')
                                as ImageProvider<Object>
                            : NetworkImage('${plans.logoUrl}'))),
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
                height: 280.h,
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
                      height: 250.h,
                      // color: Colors.orange,
                      child: SingleChildScrollView(
                        child: Wrap(children: [
                          Html(
                            data: plans.description,
                            style: {
                              "body": Style(
                                  color: Colors.black,
                                  fontFamily: 'BubblegumSans'),
                            },
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                  onTap: () {
                    if (Provider.of<UserNotifier>(context, listen: false)
                            .user
                            ?.profileComplete ==
                        false) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: MajorFont(
                                text: 'You need to complete your profile first',
                                weight: false,
                                size: 20.5,
                              ),
                              actions: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CompleteProfile()));
                                    },
                                    child: Button(text: 'Complete'))
                              ],
                            );
                          });
                    } else {
                      switch (widget.category) {
                        case 'git':
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => GIT()));
                          break;

                        case '3rd_party_auto':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThirdParty()));
                          break;

                        case 'credit_life':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreditLife()));
                          break;

                        case 'comprehensive_auto':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Comprehensive()));
                          break;
                        case 'health':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Health()));
                          break;

                        case 'marine':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Marine()));
                          break;
                        case 'gadget':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gadget()));
                          break;
                        case 'fire_burglary':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FireBurglary()));
                          break;
                        case 'travel':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComingSoon()));
                          break;
                        case 'job_loss':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobLoss()));
                          break;
                      }
                    }
                  },
                  child: Button(text: 'Purchase'))
            ],
          ),
        ),
      ),
    );
  }
}
