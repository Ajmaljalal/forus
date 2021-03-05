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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: LeftSideBar(),
            ),
          ),
        ),
        // const Spacer(),
        Container(
          width: 800.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // SliverPadding(
              //   padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              //   sliver: SliverToBoxAdapter(
              //     child: Stories(
              //       currentUser: currentUser,
              //       stories: stories,
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              //   sliver: SliverToBoxAdapter(
              //     child: Rooms(onlineUsers: onlineUsers),
              //   ),
              // ),
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
        ),
        const Spacer(),
        // Flexible(
        //   flex: 2,
        //   child: Align(
        //     alignment: Alignment.centerRight,
        //     child: Padding(
        //       padding: const EdgeInsets.all(12.0),
        //       child: ContactsList(users: onlineUsers),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
