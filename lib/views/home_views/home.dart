import 'package:flutter/material.dart';
import 'package:forus/views/home_views/home_view_desktop.dart';
import 'package:forus/views/home_views/home_view_mobile.dart';
import 'package:forus/widgets/responsive.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}
