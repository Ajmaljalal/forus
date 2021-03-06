import 'package:flutter/material.dart';
import 'package:forus/views/home_views/home_view_desktop.dart';
import 'package:forus/views/home_views/home_view_mobile.dart';
import 'package:forus/widgets/responsive.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('home build');
    final _padding = Responsive.isDesktop(context)
        ? const EdgeInsets.only(top: 20.0)
        : const EdgeInsets.only(top: 0.0);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: _padding,
          child: Responsive(
            mobile: HomeScreenMobile(),
            desktop: HomeScreenDesktop(),
          ),
        ),
      ),
    );
  }
}
