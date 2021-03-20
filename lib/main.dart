import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/services.dart';
import 'package:forus/controllers/home_controllers/home_controllers.dart';
import 'package:forus/views/navigator_views/nav_view.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  // setPathUrlStrategy();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nagashi',
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      theme: ThemeData(fontFamily: 'Helvetica, Arial, sans-serif'),
      home: NavScreen(),
      darkTheme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => NavScreen(),
          binding: HomeViewBindings(),
        ),
      ],
    );
  }
}
