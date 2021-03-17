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

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenDesktopState createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop>
    with AutomaticKeepAliveClientMixin {
  final String wall = 'Home';

  final _items = [
    LeftSideMenuItem(text: 'Home', icon: Icons.home, onTap: () {}),
    LeftSideMenuItem(text: 'My Wallet', icon: Icons.attach_money, onTap: () {}),
    LeftSideMenuItem(
        text: 'Friends', icon: Icons.people_alt_rounded, onTap: () {}),
    LeftSideMenuItem(text: 'Pages', icon: Icons.pages, onTap: () {}),
    LeftSideMenuItem(text: 'Play', icon: Icons.videocam, onTap: () {}),
    LeftSideMenuItem(text: 'Rooms', icon: Icons.group_work_sharp, onTap: () {}),
    LeftSideMenuItem(text: 'Store', icon: Icons.shopping_cart, onTap: () {}),
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
          currentWall: wall,
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
              CreatePostContainer(currentUser: currentUser),
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
