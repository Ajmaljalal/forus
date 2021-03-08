import 'package:flutter/material.dart';
import 'package:forus/data_models/models.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:forus/widgets/post_button.dart';
import 'package:forus/widgets/profile_avatar.dart';
import 'package:forus/widgets/responsive.dart';

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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('post builds');
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: isDesktop ? 5.0 : 0.0,
      ),
      elevation: isDesktop ? 1.5 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RepaintBoundary(child: _PostHeader(post: widget.post)),
                  const SizedBox(height: 10.0),
                  RepaintBoundary(child: Text(widget.post.text)),
                  const SizedBox(height: 17.0),
                ],
              ),
            ),
            RepaintBoundary(
              child: Image.network(
                widget.post.imageUrl,
              ),
            ),
            RepaintBoundary(child: _PostStats(post: widget.post)),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
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
          onPressed: () => print('More'),
          splashRadius: 20.0,
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  )),
            ],
          ),
        )
      ],
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
