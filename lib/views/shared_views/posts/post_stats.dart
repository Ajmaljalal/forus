import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/models/post.dart';
import 'package:forus/widgets/post_button.dart';

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPostButtons(),
              IconButton(
                icon: Center(
                  child: Icon(
                    CupertinoIcons.money_dollar,
                    color: ColorPalette.primary.withOpacity(0.5),
                  ),
                ),
                iconSize: 22.0,
                color: Colors.black,
                onPressed: () {},
                splashRadius: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostButtons() {
    return Row(
      children: [
        PostButton(
          icon: Icon(
            CupertinoIcons.hand_thumbsup,
            color: Colors.grey[400],
            size: 20.0,
          ),
          label: '${post.likes}',
          onTap: () => print('Like'),
        ),
        PostButton(
          icon: Icon(
            CupertinoIcons.quote_bubble,
            color: Colors.grey[400],
            size: 20.0,
          ),
          label: '${post.comments}',
          onTap: () => print('Comment'),
        ),
        PostButton(
          icon: Icon(
            CupertinoIcons.reply,
            color: Colors.grey[400],
            size: 20.0,
          ),
          label: '${post.shares}',
          onTap: () => print('Share'),
        )
      ],
    );
  }
}
