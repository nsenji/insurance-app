import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/notifiers/productType.dart';
import 'package:insurease/pages/app_pages/PlanCategories.dart';
import 'package:insurease/pages/app_pages/searchProduct.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import '../../api/get_products.dart';
import '../../styles/colors.dart';
import '../../tools/button.dart';
import '../app_pages/productDetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // await Future.delayed(Duration(seconds: 6));
    ProductTypeNotifier productType =
        Provider.of<ProductTypeNotifier>(context, listen: false);
    await getProductTypes(productType);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List icons = [
      'assets/images/healthcare.png',
      'assets/images/3rd party auto insurance.png',
      'assets/images/life-insurance.png',
      'assets/images/goods-insurance.png',
      'assets/images/marine.png',
      'assets/images/credit-card.png',
      'assets/images/gadget.png',
      'assets/images/fire-and-burglary-insurance.png',
      'assets/images/travel.png',
      'assets/images/key-man.png',
      'assets/images/job-loss.png',
      'assets/images/comprehensive-auto.png'
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Home',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primeColor,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 170.h,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    margin: EdgeInsets.only(
                        left: 15.w, right: 15.w, bottom: 10.h, top: 10.h),
                    child: Row(children: [
                      Container(
                        width: 200.w,
                        margin: EdgeInsets.only(left: 7.w, top: 7.h),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MajorFont(
                                text: 'Hi, Thomas',
                                color: AppColors.primeColor,
                                weight: false,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              MajorFont(
                                text: 'Ref : 234jr',
                                color: AppColors.blackColor,
                                size: 15,
                                weight: false,
                              )
                            ]),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 14.w, top: 8.h, right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MajorFont(
                        text: 'Select insurance product',
                        weight: false,
                        size: 15,
                        color: AppColors.primeColor,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchProduct()));
                          },
                          icon: Icon(Icons.search))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w),
                      shrinkWrap: true,
                      itemCount: Provider.of<ProductTypeNotifier>(context,
                              listen: false)
                          .productList
                          .length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlanCategories())),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 2.h,
                                top: 12.h,
                                right: 15.w,
                                left: 15.w),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      color: Colors.grey.withOpacity(0.5)),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r)),
                            height: 100.h,
                            child: Row(children: [
                              Container(
                                height: 90.h,
                                width: 130.w,
                                child: Center(
                                    child: Container(
                                  height: 45.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(icons[index]))),
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.h),
                                height: 90.h,
                                width: 195.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MajorFont(
                                        weight: false,
                                        text:
                                            '${Provider.of<ProductTypeNotifier>(context, listen: true).prodList[index].name}'),
                                    SizedBox(height: 4.h),
                                    MajorFont(
                                      weight: false,
                                      text:
                                          '${Provider.of<ProductTypeNotifier>(context, listen: true).prodList[index].premiumtype}',
                                      color: AppColors.blackColor,
                                      size: 19,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
