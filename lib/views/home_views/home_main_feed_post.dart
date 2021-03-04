import 'package:flutter/material.dart';
import 'package:forus/utils/getDeviceType.dart';

class HomeMainFeedPost extends StatefulWidget {
  HomeMainFeedPost({Key? key}) : super(key: key);

  @override
  _HomeMainFeedPostState createState() => _HomeMainFeedPostState();
}

class _HomeMainFeedPostState extends State<HomeMainFeedPost> {
  @override
  Widget build(BuildContext context) {
    final String _deviceType = getDeviceType(ctx: context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: _deviceType == 'mobile'
            ? BorderRadius.circular(0.0)
            : BorderRadius.circular(8.0),
      ),
      elevation: _deviceType == 'mobile' ? 0.0 : 1.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _buildPostHeader(),
            _buildPostBody(),
            Divider(),
            _buildPostReactionButtons(),
            // Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22.0,
              child: Text('A'),
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ajmal Jalal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3.0),
                Text(
                  '35 mins',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 0.1,
          icon: const Icon(Icons.more_horiz_rounded),
          onPressed: () {},
          constraints: const BoxConstraints(
            maxWidth: 24.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPostBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      child: Text(
        'You are not an isolated entity. You are a unique, irreplaceable part of the cosmos. Dont  forget this. You are and essential piece of the puzzle of humanity. You are not an isolated entity. You are a unique, irreplaceable part of the cosmos. Dont  forget this. You are and essential piece of the puzzle of humanity. You are not an isolated entity. You are a unique, irreplaceable part of the cosmos. Dont  forget this. You are and essential piece of the puzzle of humanity. You are not an isolated entity. You are a unique, irreplaceable part of the cosmos. Dont  forget this. You are and essential piece of the puzzle of humanity.',
        style: TextStyle(
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildPostReactionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Row(
        children: [
          _buildReactButton(
            icon: Icons.thumb_up_outlined,
            text: '23',
            callBack: () {},
          ),
          SizedBox(width: 25.0),
          _buildReactButton(
            icon: Icons.mode_comment_outlined,
            text: '45',
            callBack: () {},
          ),
          SizedBox(width: 25.0),
          _buildReactButton(
            icon: Icons.reply_sharp,
            text: '15',
            callBack: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildReactButton(
      {Function? callBack, required String text, IconData? icon}) {
    return Row(
      children: [
        IconButton(
          onPressed: callBack as void Function()?,
          icon: Icon(icon),
          splashRadius: 0.1,
          constraints: const BoxConstraints(maxWidth: 38.0),
        ),
        Text(text),
      ],
    );
  }
}
