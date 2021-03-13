import 'package:flutter/material.dart';
import 'package:forus/views/home_views/home_view_desktop.dart';
import 'package:forus/views/home_views/home_view_mobile.dart';
import 'package:forus/widgets/responsive.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('home build');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Responsive(
        mobile: HomeScreenMobile(),
        desktop: HomeScreenDesktop(),
      ),
    );
  }
}
