import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forus/controllers/home_controllers/bottom_nav_controller.dart';
import 'package:forus/views/home/home_view_mobile.dart';
import 'package:forus/views/shared/headers/mobile_header.dart';
import 'package:forus/views/shared/tab_bars/custom_tab_bar.dart';
import 'package:forus/views/wallet/wallet.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  final List<Widget> _screens = const [
    HomeScreenMobile(),
    WalletScreenMobile(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _mobileIcons = const [
    CupertinoIcons.home,
    CupertinoIcons.play,
    CupertinoIcons.photo,
    CupertinoIcons.bell,
    CupertinoIcons.ellipsis,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _mobileIcons.length,
      child: GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (ctl) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 45.0),
              child: MobileHeader(),
            ),
            body: PageView(
              controller: ctl.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _screens,
            ),
            bottomNavigationBar: Container(
              height: 40.0,
              color: Colors.white,
              child: CustomTabBar(
                icons: _mobileIcons,
                selectedIndex: ctl.selectedIndex,
                onTap: (index) {
                  ctl.changeSelectedIndex(index: index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
