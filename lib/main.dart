import 'package:flutter/material.dart';
import 'package:forus/services/firebase_services/firebase_init.dart';
import 'package:forus/views/navigator/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:forus/controllers/home_controllers/home_controllers.dart';

void main() async {
  // debugRepaintRainbowEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  await FirbaseService().initFirebase();
  runApp(
    Application(),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pywast',
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
