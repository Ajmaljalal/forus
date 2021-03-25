import 'package:flutter/material.dart';
import 'package:forus/views/friends_views.dart/friends_view_web.dart';
import 'package:forus/views/home_views/home_view_web.dart';
import 'package:forus/views/shared_views/web_header/header.dart';
import 'package:forus/views/wallet_veiws/wallet_view_web.dart';
import 'package:get/get.dart';
import 'package:forus/controllers/tabbars_controllers/left_side_bar_controller.dart';
import 'package:forus/mock/data.dart';

class NavScreenWeb extends StatefulWidget {
  @override
  _NavScreenWebState createState() => _NavScreenWebState();
}

class _NavScreenWebState extends State<NavScreenWeb> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final Map<String, Widget> _screens = const {
    '/home': HomeScreenWeb(),
    '/mywallet': WalletScreenWeb(),
    '/friends': FriendsScreenWeb(),
  };

  final List<IconData> _desktopIcons = const [
    Icons.home,
    Icons.settings,
    Icons.search_rounded
  ];

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return GetBuilder<LeftSideBarController>(
      init: LeftSideBarController(),
      builder: (ctl) {
        return DefaultTabController(
          length: _desktopIcons.length,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(_screenSize.width, 100.0),
              child: Header(
                currentUser: currentUser,
                icons: _desktopIcons,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
              ),
            ),
            body: _screens[
                '/${ctl.currentRout.replaceAll(RegExp(r"\s+"), "").toString().toLowerCase()}'],
          ),
        );
      },
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
