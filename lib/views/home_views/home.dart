import 'package:flutter/material.dart';
import 'package:forus/views/general_views/header.dart';
import 'package:forus/views/general_views/sidebar_right.dart';
import 'package:forus/views/home_views/home_main_feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Forus',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 1.0,
      // ),
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 242, 243, 247),
        child: Column(
          children: [
            Header(),
            // Padding(
            // padding: const EdgeInsets.all(15.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RightSideBar(),
                HomeMainFeed(),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Colors.white,
                  child: Text('left side'),
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
