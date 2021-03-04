import 'package:flutter/material.dart';
import 'package:forus/utils/getDeviceType.dart';
import 'package:forus/views/home_views/home_main_feed_post.dart';
import 'package:forus/views/home_views/share_your_thoughts.dart';

class HomeMainFeed extends StatefulWidget {
  HomeMainFeed({Key? key}) : super(key: key);

  @override
  _HomeMainFeedState createState() => _HomeMainFeedState();
}

class _HomeMainFeedState extends State<HomeMainFeed> {
  @override
  Widget build(BuildContext context) {
    final String _deviceType = getDeviceType(ctx: context);
    final _width = _deviceType == 'mobile'
        ? MediaQuery.of(context).size.width
        : _deviceType == 'tablet'
            ? MediaQuery.of(context).size.width * 0.65
            : MediaQuery.of(context).size.width * 0.45;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 750.0,
        minWidth: 300.0,
      ),
      child: Container(
        width: _width,
        height: MediaQuery.of(context).size.height * 1 - 82.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 17.0),
              ShareYourThoughts(),
              SizedBox(height: 10.0),
              HomeMainFeedPost(),
              HomeMainFeedPost(),
              HomeMainFeedPost(),
              HomeMainFeedPost(),
              HomeMainFeedPost(),
              HomeMainFeedPost(),
              HomeMainFeedPost(),
            ],
          ),
        ),
      ),
    );
  }
}
