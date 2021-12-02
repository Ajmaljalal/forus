import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/models/post.dart';
import 'package:forus/widgets/customIconButton.dart';
import 'package:forus/widgets/responsive.dart';

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
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 10.0 : 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPostButtons(),
              CustomIconButton(
                icon: CupertinoIcons.money_dollar,
                onTap: () => print('tipped'),
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
        _buildPostButton(
          icon: CupertinoIcons.hand_thumbsup,
          onTap: () => print('Like'),
          label: post.likes,
        ),
        const SizedBox(width: 10.0),
        _buildPostButton(
          icon: CupertinoIcons.bubble_left,
          onTap: () => print('Comment'),
          label: post.comments,
        ),
        const SizedBox(width: 10.0),
        _buildPostButton(
          icon: CupertinoIcons.reply,
          onTap: () => print('Share'),
          label: post.shares,
        ),
      ],
    );
  }

  Widget _buildPostButton({
    required IconData icon,
    required Function() onTap,
    required int label,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          icon: icon,
          onTap: onTap,
        ),
        Text(
          '$label',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 11.0,
          ),
        ),
      ],
    );
  }
}
