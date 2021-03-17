import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forus/controllers/home_controllers/main_feed_controller.dart';
import 'package:forus/models/models.dart';
import 'package:forus/models/ui_models.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/general_views/posts/create_new_post.dart';
import 'package:forus/views/general_views/posts/post_container.dart';
import 'package:forus/views/general_views/sidebars/left_side_nav_bar.dart';
import 'package:forus/views/home_views/online_friends_list.dart';
import 'package:get/get.dart';

class FriendsScreenWeb extends StatefulWidget {
  const FriendsScreenWeb({
    Key? key,
  }) : super(key: key);

  @override
  _FriendsScreenWebState createState() => _FriendsScreenWebState();
}

class _FriendsScreenWebState extends State<FriendsScreenWeb>
    with AutomaticKeepAliveClientMixin {
  final _items = [
    LeftSideMenuItem(text: 'Home', icon: Icons.home, onTap: () {}),
    LeftSideMenuItem(text: 'My Wallet', icon: Icons.attach_money, onTap: () {}),
    LeftSideMenuItem(
        text: 'Friends', icon: Icons.people_alt_rounded, onTap: () {}),
  ];

  @override
  void initState() {
    Get.put(MainFeedController());
    final MainFeedController ctrl = Get.find();
    ctrl.fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('friends web build');
    return Row(
      children: [
        _buildLeft(),
        const SizedBox(width: 10.0),
        _buildMiddle(),
        const SizedBox(width: 10.0),
        _buildRight(),
      ],
    );
  }

  Widget _buildLeft() {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerLeft,
        child: LeftSideBar(
          items: _items,
        ),
      ),
    );
  }

  Widget _buildMiddle() {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          width: 700.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Center(child: Text('Friends')),
                // child: Container(
                //   margin: const EdgeInsets.only(top: 10.0),
                //   child: GetBuilder<MainFeedController>(
                //     init: MainFeedController(),
                //     builder: (ctrl) {
                //       return ListView.builder(
                //         cacheExtent: MediaQuery.of(context).size.height,
                //         itemCount: ctrl.newsFeedPosts.length,
                //         itemBuilder: (context, index) {
                //           final Post post = ctrl.newsFeedPosts[index];
                //           return PostContainer(post: post);
                //         },
                //       );
                //     },
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  Widget _buildRight() {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          constraints: const BoxConstraints(
            maxWidth: 300.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.grey.shade700,
                width: 0.2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Hot Topics',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Text(
                  'Promotions',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                flex: 1,
                child: OnlineFriendsList(users: onlineUsers),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
