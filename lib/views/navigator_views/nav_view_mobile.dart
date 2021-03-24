import 'package:flutter/material.dart';
import 'package:forus/controllers/home_controllers/bottom_nav_controller.dart';
import 'package:forus/views/home_views/home_view_mobile.dart';
import 'package:forus/views/shared_views/posts/create_new_post_mobile.dart';
import 'package:forus/views/shared_views/tab_bars/custom_tab_bar.dart';
import 'package:forus/views/wallet_veiws/wallet_view_mobile.dart';
import 'package:get/get.dart';

class NavScreenMobile extends StatefulWidget {
  @override
  _NavScreenMobileState createState() => _NavScreenMobileState();
}

class _NavScreenMobileState extends State<NavScreenMobile> {
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  final List<Widget> _screens = const [
    HomeScreenMobile(),
    WalletScreenMobile(),
    CreateNewPostMobile(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _mobileIcons = const [
    Icons.home,
    Icons.play_circle_fill,
    Icons.add_circle,
    Icons.photo_library,
    Icons.more_horiz_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _mobileIcons.length,
      child: GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (ctl) {
          return Scaffold(
            body: PageView(
              controller: ctl.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _screens,
            ),
            bottomNavigationBar: ctl.selectedIndex != 2
                ? Container(
                    color: Colors.white,
                    child: CustomTabBar(
                      icons: _mobileIcons,
                      selectedIndex: ctl.selectedIndex,
                      onTap: (index) {
                        ctl.changeSelectedIndex(index: index);
                      },
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}

// return Navigator(
//       onGenerateRoute: (RouteSettings settings) {
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (BuildContext context) {
//             switch(settings.name) {
//               case '/':
//                 return RootPage(destination: widget.destination);
//               case '/list':
//                 return ListPage(destination: widget.destination);
//               case '/text':
//                 return TextPage(destination: widget.destination);
//             }
//           },
//         );
//       },
//     );
