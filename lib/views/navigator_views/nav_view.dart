import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/views/navigator_views/nav_view_mobile.dart';
import 'package:forus/views/navigator_views/nav_view_web.dart';
import 'package:forus/widgets/responsive.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffold,
      body: Responsive(
        mobile: NavScreenMobile(),
        desktop: NavScreenWeb(),
      ),
    );
  }
}
