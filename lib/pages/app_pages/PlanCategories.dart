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
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: '[category] plans',
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
              itemCount: Provider.of<AllPlansNotifier>(context,
                              listen: false)
                          .plansList
                          .length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails())),
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: 2.h, top: 12.h, right: 15.w, left: 15.w),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.5)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    height: 120.h,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 2.w),
                          height: 100.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(
                                      '${Provider.of<AllPlansNotifier>(context,
                              listen: false)
                          .plansList[index].logoUrl}'))),
                        ),
                        SizedBox(
                          height: 100.h,
                          width: 8.w,
                        ),
                        Container(
                          height: 100.h,
                          width: 140.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MajorFont(
                                text: 'Title : AXA PRADO 1',
                                size: 17,
                                weight: false,
                              ),
                              SizedBox(
                                height: 9.h,
                                width: 140.w,
                              ),
                              MajorFont(
                                text: 'Insurer : AXA',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 9.h,
                                width: 140.w,
                              ),
                              MajorFont(
                                text: 'Type : Fixed',
                                weight: false,
                                size: 17,
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
