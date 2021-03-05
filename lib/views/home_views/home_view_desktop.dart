import 'package:flutter/material.dart';
import 'package:forus/data_models/models.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/general_views/posts/create_new_post.dart';
import 'package:forus/views/general_views/posts/post.dart';
import 'package:forus/views/general_views/sidebars_desktop_only/left_sidebar.dart';

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: LeftSideBar(),
          ),
        ),
        const Spacer(),
        Container(
          width: 700.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreatePostContainer(currentUser: currentUser),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
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
}
