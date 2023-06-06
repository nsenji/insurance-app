import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
      'assets/images/comprehensive-auto.png',
      'assets/images/comprehensive-auto.png'
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
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
                  height: 170,
                  child: Card(
                    color: AppColors.containerColor,
                    surfaceTintColor: AppColors.containerColor,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    elevation: 15,
                    child: Row(children: [
                      Container(
                        width: 310,
                        margin: EdgeInsets.only(left: 7, top: 7),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MajorFont(
                                      text:
                                          '${Provider.of<UserNotifier>(context, listen: false).user?.firstname} ${Provider.of<UserNotifier>(context, listen: false).user?.lastname}',
                                      color: AppColors.primeColor,
                                      size: 17,
                                      weight: false,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    MajorFont(
                                      text:
                                          'Ref : ${Provider.of<UserNotifier>(context, listen: false).user?.ref}',
                                      color: AppColors.blackColor,
                                      size: 11,
                                      weight: false,
                                    ),
                                    SizedBox(
                                      height: 88,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              MajorFont(
                                                text: '0',
                                                weight: false,
                                                size: 14,
                                              ),
                                              MajorFont(
                                                  text: 'Claims',
                                                  weight: false,
                                                  size: 12,
                                                  color: AppColors.blackColor),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 12,
                                            child: VerticalDivider(
                                              width: 7,
                                              thickness: 1,
                                              color: AppColors.blackColor,
                                              endIndent: 3,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              MajorFont(
                                                text: '0',
                                                weight: false,
                                                size: 14,
                                              ),
                                              MajorFont(
                                                  text: 'Policies',
                                                  weight: false,
                                                  color: AppColors.blackColor,
                                                  size: 12),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: 95, left: 100),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/insuance_image_green.png'))),
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
                      left: 14, top: 8, right: 15, bottom: 8),
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
                  height: 5,
                ),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                        primary: true,
                        padding: EdgeInsets.only(left: 2, right: 2),
                        shrinkWrap: true,
                        itemCount: Provider.of<ProductTypeNotifier>(context,
                                listen: true)
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
                                  left: 20, right: 20, bottom: 7),
                              child: Row(children: [
                                Container(
                                  height: 70,
                                  width: 130,
                                  child: Center(
                                      child: Container(
                                    height: 55,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(icons[index]))),
                                  )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 12),
                                  padding: EdgeInsets.only(top: 8),
                                  height: 70,
                                  width: 145,
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
                                      SizedBox(height: 4),
                                      MajorFont(
                                        weight: false,
                                        text:
                                            '${Provider.of<ProductTypeNotifier>(context, listen: true).prodList[index].premiumtype}',
                                        color:
                                            Color.fromARGB(255, 173, 173, 173),
                                        size: 15,
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 40,
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
