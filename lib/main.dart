import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:device_preview/device_preview.dart';
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
  runApp(
    // DevicePreview(
    Application(),
    // builder: (context) => Application(),
    // ),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Batwa',
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: 'Helvetica, Arial, sans-serif',
      ),
      home: NavScreen(),
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
