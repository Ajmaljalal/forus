import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forus/utils/getDeviceType.dart';
import 'package:forus/views/general_views/headers/header.dart';
import 'package:forus/views/general_views/sidebars_desktop_only/left_sidebar.dart';
import 'views/home_views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    Application(),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forus',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo[600],
          accentColor: Colors.indigo[100]),
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    String _deviceType = getDeviceType(ctx: context);

    return Scaffold(
      appBar: _deviceType != 'desktop'
          ? PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                title: Text(
                  'Forus',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                elevation: 1.0,
              ),
            )
          : null,
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 242, 243, 247),
        child: Column(
          children: [
            Visibility(
              visible: _deviceType == 'desktop' ? true : false,
              child: Header(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _deviceType == 'mobile' ? false : true,
                  child: LeftSideBar(),
                ),
                Home(),
                Visibility(
                  visible: _deviceType == 'desktop' ? true : false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 1 - 78.0,
                    color: Colors.white,
                    child: Text('left side'),
                  ),
                )
              ],
            ),
            // )
          ],
        ),
      ),
    );
  }
}
