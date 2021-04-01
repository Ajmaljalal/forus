import 'package:flutter/material.dart';
import 'package:forus/models/post.dart';
import 'package:forus/views/shared_views/posts/post_more_options_menu.dart';
import 'package:forus/widgets/profile_avatar.dart';
import 'package:get/get.dart';

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RepaintBoundary(child: ProfileAvatar(imageUrl: post.user.imageUrl)),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.dateTime} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            Get.defaultDialog(
              title: 'What do you want to do?',
              titleStyle: TextStyle(height: 1.5),
              radius: 10.0,
              content: PopupMenu(),
            );
          },
          splashRadius: 20.0,
        ),
      ],
    );
  }
}
