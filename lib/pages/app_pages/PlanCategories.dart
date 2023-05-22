import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/api/get_plans.dart';
import 'package:insurease/pages/app_pages/productDetails.dart';
import 'package:insurease/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../notifiers/allPlansNotifier.dart';
import '../../notifiers/productType.dart';
import '../../tools/major_font.dart';

class PlanCategories extends StatefulWidget {
  dynamic prodIndex;
  PlanCategories({super.key, required this.prodIndex});

  @override
  State<PlanCategories> createState() => _PlanCategoriesState();
}

class _PlanCategoriesState extends State<PlanCategories> {
  bool isLoading2 = true;

  @override
  void initState() {
    super.initState();
    loadData2();
  }

  void loadData2() async {
    AllPlansNotifier allPlansNotifier =
        Provider.of<AllPlansNotifier>(context, listen: false);
    String name = Provider.of<ProductTypeNotifier>(context, listen: false)
        .prodList[widget.prodIndex]
        .slug;
    await getPlans(allPlansNotifier, name);
    setState(() {
      isLoading2 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String name2 = Provider.of<ProductTypeNotifier>(context, listen: false)
        .prodList[widget.prodIndex]
        .slug;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: '$name2 insurance plans',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: isLoading2
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primeColor,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              shrinkWrap: true,
              itemCount: Provider.of<AllPlansNotifier>(context, listen: false)
                  .plansList
                  .length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                planIndex: index,
                                category: name2,
                              ))),
                  child: Container(
                    margin: EdgeInsets.only(top: 13.h, right: 15.w, left: 15.w),
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
                    height: 120.h,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 9.w),
                          height: 100.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Provider.of<AllPlansNotifier>(context,
                                                  listen: false)
                                              .plansList[index]
                                              .insurer ==
                                          'Tangerine'
                                      ? AssetImage(
                                              'assets/images/tangerine-logo.png')
                                          as ImageProvider<Object>
                                      : NetworkImage(
                                          '${Provider.of<AllPlansNotifier>(context, listen: false).plansList[index].logoUrl}'))),
                        ),
                        SizedBox(
                          height: 100.h,
                          width: 22.w,
                        ),
                        Container(
                          height: 100.h,
                          width: 160.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MajorFont(
                                text:
                                    '${Provider.of<AllPlansNotifier>(context, listen: false).plansList[index].title}',
                                size: 17,
                                weight: false,
                                color: AppColors.primeColor,
                                flowover: true,
                              ),
                              SizedBox(
                                height: 9.h,
                                width: 140.w,
                              ),
                              MajorFont(
                                text:
                                    'By : ${Provider.of<AllPlansNotifier>(context, listen: false).plansList[index].insurer}',
                                weight: false,
                                size: 17,
                                flowover: true,
                                color: AppColors.blackColor,
                              ),
                              SizedBox(
                                height: 9.h,
                                width: 140.w,
                              ),
                              MajorFont(
                                text:
                                    'Type : ${Provider.of<AllPlansNotifier>(context, listen: false).plansList[index].premiumType}',
                                weight: false,
                                size: 17,
                                flowover: true,
                                color: AppColors.blackColor,
                              ),
                              SizedBox(
                                height: 5.h,
                                width: 140.w,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 3.h),
                                      child: Text(
                                        'Details',
                                        style: TextStyle(
                                            color: AppColors.primeColor,
                                            fontSize: 14.sp,
                                            fontFamily: 'BubblegumSans'),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: AppColors.primeColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
