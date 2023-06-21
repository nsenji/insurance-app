import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../TabBar_widgets/claimsTab.dart';
import '../TabBar_widgets/policiesTab.dart';

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  State<Policies> createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: AppColors.containerColor,
            title: Row(
              children: [
                Image.asset('assets/images/curacel image.png',
                width: 120,
                height: 100,
                color: AppColors.primeColor,
                ),
                
              ],
            ),
            bottom: TabBar(
                labelColor: AppColors.primeColor,
                unselectedLabelColor: AppColors.blackColor,
                indicatorPadding: const EdgeInsets.only(left: 15, right: 15),
                indicatorColor: AppColors.primeColor,
                controller: _tabController,
                tabs: const [
                  Tab(
                      child: Text(
                    'Policies',
                    style: TextStyle(fontFamily: 'BubblegumSans', fontSize: 20),
                  )),
                  Tab(
                      child: Text(
                    'Claims',
                    style: TextStyle(fontFamily: 'BubblegumSans', fontSize: 20),
                  )),
                ]),
          ),
          body: TabBarView(
              controller: _tabController,
              children: const [PoliciesTab(), ClaimsTab()])),
    );
  }
}
