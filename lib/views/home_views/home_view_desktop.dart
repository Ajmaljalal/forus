import 'package:flutter/material.dart';
import 'package:forus/data_models/models.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/general_views/posts/create_new_post.dart';
import 'package:forus/views/general_views/posts/post.dart';
import 'package:forus/views/general_views/sidebars_desktop_only/left_sidebar.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenDesktopState createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('home desktop build');
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: LeftSideBar(),
          ),
        ),
        Container(
          width: 680.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreatePostContainer(currentUser: currentUser),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final Post post = posts[index];
                      return PostContainer(post: post);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
