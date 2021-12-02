import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Divider(height: 0.0),
              _buildPopupMenuItem(
                text: 'Save',
                icon: CupertinoIcons.floppy_disk,
              ),
              _buildPopupMenuItem(
                text: 'Unfollow post owner',
                icon: CupertinoIcons.eye_slash,
              ),
              _buildPopupMenuItem(
                text: 'Report post',
                icon: CupertinoIcons.info_circle,
              ),
              _buildPopupMenuItem(
                text: 'Copy link',
                icon: CupertinoIcons.link,
              ),
              _buildPopupMenuItem(
                text: 'Take a snapshot',
                icon: CupertinoIcons.camera,
              ),
              _buildPopupMenuItem(
                text: 'Go to details',
                icon: CupertinoIcons.ellipsis,
                hasTrailing: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenuItem({
    required String text,
    required IconData icon,
    bool? hasTrailing = false,
  }) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: ListTile(
            horizontalTitleGap: 5.0,
            hoverColor: Colors.grey[200],
            mouseCursor: SystemMouseCursors.click,
            title: Text(text),
            leading: Icon(icon),
            trailing: hasTrailing == true ? Icon(CupertinoIcons.forward) : null,
            onTap: () {
              print('tapped');
            },
          ),
        ),
        // const Divider(height: 0.0),
      ],
    );
  }
}
