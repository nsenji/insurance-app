import 'package:flutter/material.dart';
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
    var plans = Provider.of<AllPlansNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
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
                backgroundColor: AppColors.greyColor,
                color: AppColors.primeColor,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(left: 2, right: 2),
              shrinkWrap: true,
              itemCount: plans
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
                    margin: const EdgeInsets.only(top: 13, right: 15, left: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            // changes position of shadow
                          ),
                        ],
                        color: AppColors.containerColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9))),
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 9),
                          height: 100,
                          width: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: plans
                                              .plansList[index]
                                              .insurer ==
                                          'Tangerine'
                                      ? const AssetImage(
                                              'assets/images/tangerine-logo.png')
                                          as ImageProvider<Object>
                                      : NetworkImage(
                                          '${plans.plansList[index].logoUrl}'))),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 100,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MajorFont(
                                  text:
                                      '${plans.plansList[index].title}',
                                  size: 17,
                                  weight: false,
                                  color: AppColors.primeColor,
                                  flowover: true,
                                ),
                                const SizedBox(
                                  height: 14,
                                  width: 140,
                                ),
                                MajorFont(
                                  text:
                                      'By : ${plans.plansList[index].insurer}',
                                  weight: false,
                                  size: 17,
                                  flowover: true,
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(
                                  height: 9,
                                  width: 140,
                                ),
                                MajorFont(
                                  text:
                                      'Type : ${plans.plansList[index].premiumType}',
                                  weight: false,
                                  size: 17,
                                  flowover: true,
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                  width: 140,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 3),
                                        child: Text(
                                          'Details',
                                          style: TextStyle(
                                              color: AppColors.primeColor,
                                              fontSize: 14,
                                              fontFamily: 'BubblegumSans'),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    SizedBox(
                                      width: 2,
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
