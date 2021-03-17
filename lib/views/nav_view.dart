import 'package:flutter/material.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/home_views/home.dart';
import 'package:forus/views/wallet_veiws/wallet_view.dart';
import 'package:forus/widgets/responsive.dart';
import 'general_views/desktop_header/header.dart';
import 'general_views/tab_bars/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
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
    Home(),
    Wallet(),
    Scaffold(),
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

  final List<IconData> _desktopIcons = const [
    Icons.home,
    Icons.settings,
    Icons.search_rounded
  ];

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: Responsive.isDesktop(context)
          ? _desktopIcons.length
          : _mobileIcons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(_screenSize.width, 100.0),
                child: Header(
                  currentUser: currentUser,
                  icons: _desktopIcons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChange,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                color: Colors.white,
                child: CustomTabBar(
                  icons: _mobileIcons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => _pageController.jumpToPage(
                    index,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
