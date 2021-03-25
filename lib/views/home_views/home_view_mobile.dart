import 'package:flutter/material.dart';
import 'package:forus/models/models.dart';
import 'package:get/get.dart';
import 'package:forus/mock/data.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/views/shared_views/posts/create_new_post_mobile.dart';
import 'package:forus/views/shared_views/posts/post_container.dart';
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
            'batwa',
            style: const TextStyle(
              color: ColorPalette.primary,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.add_circle_outline_rounded,
              iconSize: 20.0,
              onPressed: () {
                Get.to(() => CreateNewPostMobile());
              },
              color: ColorPalette.secondary,
            ),
            CircleButton(
              icon: Icons.search,
              iconSize: 20.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: Icons.filter_alt_rounded,
              iconSize: 20.0,
              onPressed: () => print('Messenger'),
            ),
            const SizedBox(width: 12.0),
          ],
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
