import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/userObjectNotifier.dart';
import '../../styles/colors.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppColors.whiteColor,
        title: TextField(
          style: const TextStyle(color: AppColors.blackColor),
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:
                '${Provider.of<UserNotifier>(context, listen: true).user?.firstname}',
            hintStyle: const TextStyle(
                fontFamily: 'BubblegumSans',
                fontWeight: FontWeight.normal,
                fontSize: 15),
            // Add a clear button to the search bar
            suffixIcon: IconButton(
              color: AppColors.primeColor,
              icon: const Icon(Icons.send),
              onPressed: () {}, //perform the search here
            ),
            // Add a search icon or button to the search bar

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15.0.r),
            // ),
          ),
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
