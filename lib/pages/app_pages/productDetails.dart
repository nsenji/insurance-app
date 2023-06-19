import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:insurease/notifiers/allPlansNotifier.dart';
import 'package:insurease/notifiers/userObjectNotifier.dart';
import 'package:insurease/pages/additional%20Details/creditLife.dart';
import 'package:insurease/pages/app_pages/completeProfile.dart';
import 'package:insurease/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../authentication/getUser.dart';
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
        elevation: 0,
        backgroundColor: AppColors.containerColor,
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
        primary: true,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 100,
                width: 150,
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
                width: 320,
                height: 50,
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
                margin: const EdgeInsets.only(left: 30, right: 30),
                height: 185,
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
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MajorFont(
                                text: 'Category',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MajorFont(
                                text: 'Code',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MajorFont(
                                text: 'Insurer',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MajorFont(
                                text: 'Premium rate',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MajorFont(
                                text: 'Premium type',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              MajorFont(
                                text: 'Duration (months)',
                                weight: false,
                                size: 17,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const Expanded(child: SizedBox()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            // padding: EdgeInsets.only(right: 8),
                            height: 180,

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
                                  height: 8,
                                ),
                                MajorFont(
                                  text: '${plans.code}',
                                  weight: false,
                                  size: 16,
                                  color: AppColors.blackColor,
                                  flowover: true,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MajorFont(
                                  text: '${plans.insurer}',
                                  weight: false,
                                  size: 16,
                                  color: AppColors.blackColor,
                                  flowover: true,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MajorFont(
                                  text: '${plans.premiumRate}',
                                  weight: false,
                                  size: 16,
                                  color: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MajorFont(
                                  text: '${plans.premiumType}',
                                  weight: false,
                                  size: 16,
                                  color: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                MajorFont(
                                  text: '${plans.coverDuration}',
                                  weight: false,
                                  size: 16,
                                  color: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                height: 280,
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
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      height: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MajorFont(
                          text: 'Description',
                          weight: false,
                          size: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: 250,
                      // color: Colors.orange,
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          primary: true,
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
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
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
                              backgroundColor: AppColors.containerColor,
                              iconColor: Colors.red,
                              icon: Icon(Icons.warning,size: 39,),
                              content: Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: MajorFont(
                                  text:
                                      'Complete your profile first !',
                                  weight: false,
                                  size: 20.5,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              actions: [
                                InkWell(
                                    onTap: () {
                                      
                                    },
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primeColor ,
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CompleteProfile()));
                                      }, child: MajorFont(text: 'Complete', weight: false,size: 18,color: AppColors.whiteColor,)))
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
                                  builder: (context) =>
                                      Health(code: plans.code)));
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
