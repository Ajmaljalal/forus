import 'package:flutter/material.dart';
import 'package:forus/views/friends_views.dart/friends_view_mobile.dart';
import 'package:forus/views/home_views/home_view_mobile.dart';
import 'package:forus/views/wallet_veiws/wallet_view_mobile.dart';
import '../general_views/tab_bars/custom_tab_bar.dart';

class NavScreenMobile extends StatefulWidget {
  @override
  _NavScreenMobileState createState() => _NavScreenMobileState();
}

class _NavScreenMobileState extends State<NavScreenMobile> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = const [
    HomeScreenMobile(),
    WalletScreenMobile(),
    FriendsScreenMobile(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _mobileIcons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.group_work_sharp,
    Icons.notifications_none,
    Icons.menu,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _mobileIcons.length,
      child: Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChange,
            physics: const NeverScrollableScrollPhysics(),
            children: _screens,
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: CustomTabBar(
              icons: _mobileIcons,
              selectedIndex: _selectedIndex,
              onTap: (index) => _pageController.jumpToPage(
                index,
              ),
            ),
          )),
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
