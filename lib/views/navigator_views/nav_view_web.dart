import 'package:flutter/material.dart';
import 'package:forus/views/home_views/home_view_web.dart';
import 'package:forus/views/wallet_veiws/wallet_view_web.dart';
import 'package:get/get.dart';
import 'package:forus/controllers/home_controllers/tabbars_controller.dart';
import 'package:forus/mock/data.dart';
import '../general_views/desktop_header/header.dart';

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
    // Get.put(LeftMenueController());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final Map<String, Widget> _screens = const {
    '/home': HomeScreenWeb(),
    '/mywallet': WalletScreenWeb(),
  };

  final List<IconData> _desktopIcons = const [
    Icons.home,
    Icons.settings,
    Icons.search_rounded
  ];

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return GetBuilder<TabBarsController>(
      init: TabBarsController(),
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
