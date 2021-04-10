import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forus/models/models.dart';
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
    return ListView.builder(
      cacheExtent: MediaQuery.of(context).size.height / 2,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final Post post = posts[index];
        return PostContainer(post: post);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
