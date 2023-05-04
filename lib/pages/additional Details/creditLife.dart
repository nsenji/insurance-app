import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/app_pages/payment.dart';
import 'package:insurease/styles/colors.dart';

import '../../tools/button.dart';
import '../../tools/major_font.dart';

class CreditLife extends StatefulWidget {
  const CreditLife({super.key});

  @override
  State<CreditLife> createState() => _CreditLifeState();
}

class _CreditLifeState extends State<CreditLife> {
  final TextEditingController _productCode = TextEditingController();
  final TextEditingController _customerRef = TextEditingController();
  final TextEditingController _paymentType = TextEditingController();
  final TextEditingController _policyStartDate = TextEditingController();
  final TextEditingController _assetValue = TextEditingController();
  final TextEditingController _loanDuration = TextEditingController();
  final TextEditingController _installments = TextEditingController();
  final TextEditingController _natureOfBusiness = TextEditingController();
  final TextEditingController _businessAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Additional details',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30.h, left: 30.w, right: 20.w, bottom: 30.h),
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
                borderRadius: BorderRadius.all(Radius.circular(20.r))),
            // color: Colors.white,
            height: 910.h,
            width: 300.w,

            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _productCode,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Product Code',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'username',

                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(17.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _customerRef,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Customer ref',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'Email',

                        ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(17.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    obscureText: true,
                    controller: _paymentType,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Payment type',
                      weight: false,
                      size: 15,
                    )),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(17.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _policyStartDate,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //   //borderRadius: BorderRadius.circular(60)
                      // ),
                      label: MajorFont(
                        text: 'Policy Start Date',
                        weight: false,
                        size: 15,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _assetValue,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Amount insured',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'username',

                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _loanDuration,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Loan duration',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'username',

                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _installments,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Monthly Loan Instalment',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'username',

                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _natureOfBusiness,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Nature of business',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'username',

                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: TextField(
                    style: TextStyle(color: AppColors.blackColor),
                    controller: _businessAddress,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   //borderRadius: BorderRadius.circular(60)
                        // ),
                        label: MajorFont(
                      text: 'Business address',
                      weight: false,
                      size: 15,
                    )
                        //hintText: 'username',

                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Payment())),
                      child: Button(text: 'Submit')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
