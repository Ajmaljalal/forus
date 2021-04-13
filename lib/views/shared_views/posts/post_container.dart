import 'package:flutter/material.dart';
import 'package:forus/models/models.dart';
import 'package:forus/views/shared_views/posts/post_header.dart';
import 'package:forus/views/shared_views/posts/post_images_mobile.dart';
import 'package:forus/views/shared_views/posts/post_images_web.dart';
import 'package:forus/views/shared_views/posts/post_stats.dart';
import 'package:forus/widgets/responsive.dart';
import 'package:forus/widgets/video_player_chewie/video_player.dart';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    print('post builds');
    return Card(
      elevation: 0.1,
      margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(post: widget.post),
                  const SizedBox(height: 10.0),
                  Text(widget.post.text),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            _buildImages(),
            _buildVideo(),
            const Divider(height: 0.0),
            PostStats(post: widget.post),
          ],
        ),
      ),
    );
  }

  Widget _buildImages() {
    if (widget.post.imageUrl.length > 0) {
      return Responsive.isDesktop(context)
          ? PostImagesWeb(images: widget.post.imageUrl)
          : PostImagesMobile(images: widget.post.imageUrl);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildVideo() {
    if (widget.post.videoUrl != null && widget.post.videoUrl != '') {
      return VideoPlayerUtil(source: widget.post.videoUrl!);
    } else {
      return const SizedBox.shrink();
    }
  }
}
