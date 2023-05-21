import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/api/getUser.dart';
import 'package:insurease/notifiers/productType.dart';
import 'package:insurease/pages/app_pages/PlanCategories.dart';
import 'package:insurease/pages/app_pages/searchProduct.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import '../../api/get_products.dart';
import '../../notifiers/userObjectNotifier.dart';
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
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    await getProductTypes(productType);
    await getUser(userNotifier);
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
      'assets/images/marine.png',
      'assets/images/goods-insurance.png',
      'assets/images/gadget.png',
      'assets/images/credit-card.png',
      'assets/images/fire-and-burglary-insurance.png',
      'assets/images/travel.png',
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
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: SizedBox(
                    height: 35.h,
                    child: MajorFont(
                      text:
                          'Hi, ${Provider.of<UserNotifier>(context, listen: false).user?.lastname}',
                      color: AppColors.primeColor,
                      weight: false,
                      size: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 170.h,
                  child: Card(
                    color: AppColors.containerColor,
                    surfaceTintColor: AppColors.containerColor,
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    elevation: 15,
                    child: Row(children: [
                      Container(
                        width: 310.w,
                        margin: EdgeInsets.only(left: 7.h, top: 7.h),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150.w,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    MajorFont(
                                      text:
                                          'Ref : ${Provider.of<UserNotifier>(context, listen: false).user?.ref}',
                                      color: AppColors.blackColor,
                                      size: 11,
                                      weight: false,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 40.h, left: 20.w),
                                      child: MajorFont(
                                        text: '0 UGX',
                                        size: 17,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 2, left: 20.w),
                                      child: MajorFont(
                                        text: 'Amount Insured',
                                        weight: false,
                                        size: 11,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Row(
                                        children: [
                                          MajorFont(
                                            text: '0',
                                            weight: false,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          MajorFont(
                                            text: 'Active policies',
                                            weight: false,
                                            size: 11,
                                            color: AppColors.blackColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 30.w, bottom: 20.h),
                              child: Container(
                                height: 90.h,
                                width: 90.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Daco_4959960.png'))),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(
                      left: 14.w, top: 8.h, right: 15.w, bottom: 8.h),
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
                  child: Scrollbar(
                    thumbVisibility: true,
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
                                    builder: (context) => PlanCategories(
                                          prodIndex: index,
                                        ))),
                            child: Card(
                              surfaceTintColor: AppColors.whiteColor,
                              color: AppColors.whiteColor,
                              elevation: 10,
                              margin: EdgeInsets.only(
                                  left: 20.w, right: 20.w, bottom: 7),
                              child: Row(children: [
                                Container(
                                  height: 70.h,
                                  width: 130.w,
                                  child: Center(
                                      child: Container(
                                    height: 55.h,
                                    width: 75.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(icons[index]))),
                                  )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 12.h),
                                  padding: EdgeInsets.only(top: 8.h),
                                  height: 70.h,
                                  width: 145.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MajorFont(
                                        size: 17,
                                        weight: false,
                                        text:
                                            '${Provider.of<ProductTypeNotifier>(context, listen: true).prodList[index].name}',
                                        color: AppColors.blackColor,
                                      ),
                                      SizedBox(height: 4.h),
                                      MajorFont(
                                        weight: false,
                                        text:
                                            '${Provider.of<ProductTypeNotifier>(context, listen: true).prodList[index].premiumtype}',
                                        color:
                                            Color.fromARGB(255, 173, 173, 173),
                                        size: 15,
                                      ),
                                      SizedBox(
                                        height: 9.h,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80.h,
                                  width: 40.w,
                                  child: Center(
                                      child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: AppColors.primeColor,
                                  )),
                                )
                              ]),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
    );
  }
}
