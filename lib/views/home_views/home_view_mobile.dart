import 'package:flutter/material.dart';
import 'package:forus/models/models.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/views/general_views/posts/create_new_post.dart';
import 'package:forus/views/general_views/posts/post_container.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/circled_button.dart';

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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: const Text(
            'forus',
            style: const TextStyle(
              color: ColorPalette.primary,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 20.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: Icons.notifications,
              iconSize: 20.0,
              onPressed: () => print('Messenger'),
            ),
            const SizedBox(width: 12.0),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
