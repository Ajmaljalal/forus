import 'package:flutter/material.dart';
import 'package:forus/models/models.dart';
import 'package:forus/views/shared_views/posts/post_header.dart';
import 'package:forus/views/shared_views/posts/post_images.dart';
import 'package:forus/views/shared_views/posts/post_stats.dart';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer>
    with AutomaticKeepAliveClientMixin {
  // Calculate dominant color from ImageProvider
  // Future<Color> getImagePalette(ImageProvider imageProvider) async {
  //   final PaletteGenerator paletteGenerator =
  //       await PaletteGenerator.fromImageProvider(imageProvider);
  //   return paletteGenerator.lightMutedColor!.color;
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('post builds');
    return Card(
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RepaintBoundary(child: PostHeader(post: widget.post)),
                  const SizedBox(height: 10.0),
                  RepaintBoundary(child: Text(widget.post.text)),
                  const SizedBox(height: 17.0),
                ],
              ),
            ),
            PostImages(images: widget.post.imageUrl),
            PostStats(post: widget.post),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
