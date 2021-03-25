import 'package:flutter/material.dart';
import 'package:forus/models/post.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:forus/widgets/post_button.dart';

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: RepaintBoundary(
        child: Column(
          children: [
            const Divider(
              height: 0.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildPostButtons(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: CircleButton(
                      icon: Icons.attach_money_rounded,
                      iconSize: 20.0,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostButtons() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PostButton(
            icon: Icon(
              Icons.thumb_up_alt_outlined,
              color: Colors.grey[400],
              size: 20.0,
            ),
            label: '${post.likes}',
            onTap: () => print('Like'),
          ),
          PostButton(
            icon: Icon(
              Icons.mode_comment_outlined,
              color: Colors.grey[400],
              size: 20.0,
            ),
            label: '${post.comments}',
            onTap: () => print('Comment'),
          ),
          PostButton(
            icon: Icon(
              Icons.reply_outlined,
              color: Colors.grey[400],
              size: 25.0,
            ),
            label: '${post.shares}',
            onTap: () => print('Share'),
          )
        ],
      ),
    );
  }
}
