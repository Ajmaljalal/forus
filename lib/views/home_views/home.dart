import 'package:flutter/material.dart';
import 'package:forus/views/home_views/home_main_feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeMainFeed(),
    );
  }
}
