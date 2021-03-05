import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forus/views/nav_view.dart';

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
      home: NavScreen(),
    );
  }
}
