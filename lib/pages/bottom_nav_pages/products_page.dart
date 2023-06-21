import 'package:flutter/material.dart';
import 'package:insurease/notifiers/productType.dart';
import 'package:insurease/pages/app_pages/PlanCategories.dart';
import 'package:insurease/pages/app_pages/searchProduct.dart';
import 'package:insurease/tools/major_font.dart';
import 'package:provider/provider.dart';

import '../../notifiers/userObjectNotifier.dart';
import '../../styles/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;

 

  

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
      'assets/images/comprehensive-auto.png',
      'assets/images/comprehensive-auto.png',
      'assets/images/comprehensive-auto.png'
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications_outlined,size: 25,),
          )
        ],
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Home',
          color: AppColors.blackColor,
          weight: false,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black
        )
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children:  const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.containerColor
                ),
                child: Center(
                child: Text('coming soon...'),
              )),

              ListTile(title: Text(''),)
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primeColor,
              ),
            )
          : SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Card(
                      color: AppColors.containerColor,
                      surfaceTintColor: AppColors.containerColor,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 3),
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
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
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      MajorFont(
                                        text:
                                            'Ref : ${Provider.of<UserNotifier>(context, listen: false).user?.ref}',
                                        color: AppColors.blackColor,
                                        size: 11,
                                        weight: false,
                                      ),
                                      const SizedBox(
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
                                            const SizedBox(
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
                              Expanded(
                                  child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/insuance_image_green.png'))),
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    margin:
                        const EdgeInsets.only(left: 14, top: 13, right: 15, bottom: 8),
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
                                      builder: (context) => const SearchProduct()));
                            },
                            icon: const Icon(Icons.search))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                          primary: true,
                          padding: const EdgeInsets.only(left: 2, right: 2),
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
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 7, top: 5),
                                child: Row(children: [
                                  SizedBox(
                                    height: 70,
                                    width: 100,
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
                                    margin: const EdgeInsets.only(top: 12),
                                    padding: const EdgeInsets.only(top: 8),
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
                                        const SizedBox(height: 4),
                                        MajorFont(
                                          weight: false,
                                          text:
                                              '${Provider.of<ProductTypeNotifier>(context, listen: true).prodList[index].premiumtype}',
                                          color:
                                              const Color.fromARGB(255, 173, 173, 173),
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 15),
                                      child: Align(
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                            color: AppColors.primeColor,
                                          )),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
          ),
    );
  }
}
