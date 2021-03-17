import 'package:flutter/material.dart';
import 'package:forus/views/wallet_veiws/wallet_view.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:forus/controllers/home_controllers/home_controllers.dart';
import 'package:forus/views/nav_view.dart';
// import 'package:forus/views/home_views/home.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(
    Application(),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // checkerboardRasterCacheImages: true,
      title: 'Forus',
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      getPages: [
        GetPage(
          name: '/',
          page: () => NavScreen(),
          binding: HomeViewBindings(),
        ),
        GetPage(
          name: '/mywallet',
          page: () => Wallet(),
          binding: HomeViewBindings(),
        ),
      ],
    );
  }
}
