import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/major_font.dart';

import '../../styles/colors.dart';
import '../../tools/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Hello [username]',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 14, top: 8),
            child: MajorFont(
              text: 'Select insurance product',
              weight: false,
              size: 14,
              color: AppColors.primeColor,
            ),
          ),
          Container(
            // Add padding around the search bar
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.h),
            // Use a Material design search bar
            child: TextField(
              style: TextStyle(color: AppColors.blackColor),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Product...',
                hintStyle: TextStyle(
                    fontFamily: 'BubblegumSans',
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp),
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  color: AppColors.primeColor,
                  icon: Icon(Icons.send),
                  onPressed: () {}, //perform the search here
                ),
                // Add a search icon or button to the search bar
                prefixIcon: 
                 Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0.r),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 13.w),
            height: 1.h,
            width: 335.w,
            color: Color.fromARGB(94, 0, 0, 0),
          ),
          Container(
            margin: EdgeInsets.only(left: 14.w, top: 11.h),
            // color: Colors.blue,
            height: 514.h,
            width: 333.w,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 2,right: 2),
              shrinkWrap: true,
                itemCount: 23,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 13.h,top: 2.h),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, 
                          color: Colors.grey.withOpacity(0.5)
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    height: 100.h,
                    width: 332.w,
                  );
                }),
          )
        ],
      ),
    );
  }
}
