import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:forus/controllers/home_controllers/main_feed_controller.dart';
import 'package:forus/models/models.dart';
import 'package:forus/models/ui_models.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/home_views/online_friends_list.dart';
import 'package:forus/views/new_post_views/create_new_post_web.dart';
import 'package:forus/views/shared_views/posts/post_container.dart';
import 'package:forus/views/shared_views/sidebars/left_side_nav_bar.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb>
    with AutomaticKeepAliveClientMixin {
  final _items = const [
    LeftSideMenuItem(text: 'Home', icon: CupertinoIcons.home),
    LeftSideMenuItem(text: 'My Wallet', icon: CupertinoIcons.money_dollar),
    LeftSideMenuItem(text: 'Friends', icon: CupertinoIcons.group),
    LeftSideMenuItem(text: 'Pages', icon: CupertinoIcons.flag),
    LeftSideMenuItem(text: 'Play', icon: CupertinoIcons.videocam),
    LeftSideMenuItem(text: 'Rooms', icon: CupertinoIcons.cube_box),
    LeftSideMenuItem(text: 'Store', icon: CupertinoIcons.shopping_cart),
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
    print('home desktop build');
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
          innerRout: false,
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
              CreateNewPostWeb(currentUser: currentUser),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: GetBuilder<MainFeedController>(
                    init: MainFeedController(),
                    builder: (ctrl) {
                      return ListView.builder(
                        cacheExtent: MediaQuery.of(context).size.height,
                        itemCount: ctrl.newsFeedPosts.length,
                        itemBuilder: (context, index) {
                          final Post post = ctrl.newsFeedPosts[index];
                          return PostContainer(post: post);
                        },
                      );
                    },
                  ),
                ),
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
