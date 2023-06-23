import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
import 'package:insurease/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../Firebase_paths/user_by_ID.dart';
import '../../api/get_products.dart';
import '../../authentication/getUser.dart';
import '../../notifiers/productType.dart';
import '../../notifiers/userObjectNotifier.dart';

class Restart extends StatefulWidget {
  const Restart({super.key});

  @override
  State<Restart> createState() => _RestartState();
}

class _RestartState extends State<Restart> {
  var loading = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    // await Future.delayed(Duration(seconds: 6));
    ProductTypeNotifier productType =
        Provider.of<ProductTypeNotifier>(context, listen: false);
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    UserByID userByID = Provider.of<UserByID>(context, listen: false);
    await userByID.userById;
    await getProductTypes(productType);
    await getUser(userNotifier, userByID);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.primeColor,
                backgroundColor: AppColors.greyColor,
              ),
            ),
          )
        : const NavBar();
  }
}
