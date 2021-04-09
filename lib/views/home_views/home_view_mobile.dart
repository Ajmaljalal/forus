import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forus/models/models.dart';
import 'package:forus/views/shared_views/headers/mobile_header.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/shared_views/posts/post_container.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('mobile home');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MobileHeader(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
