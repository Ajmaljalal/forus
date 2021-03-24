import 'package:flutter/material.dart';
import 'package:forus/controllers/home_controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/models/models.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:forus/widgets/responsive.dart';

import 'create_new_post.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  openCreateNewPostModal(context) {
    final BottomNavController ctl = Get.find();
    if (Responsive.isDesktop(context)) {
      Get.defaultDialog(
        title: 'Speak Out',
        radius: 5.0,
        content: CreateNewPostModal(),
      );
    } else {
      ctl.changeSelectedIndex(index: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          children: [
            _buildSpeakoutButton(context),
            _buildAttachmentButtons(),
          ],
        ),
      ),
    );
  }

  _buildSpeakoutButton(context) {
    return Expanded(
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          openCreateNewPostModal(context);
        },
        child: Row(
          children: [
            const Icon(
              Icons.speaker,
              color: ColorPalette.secondary,
            ),
            const SizedBox(
              width: 5.0,
            ),
            const Text('Speak out loud with proud!'),
          ],
        ),
      ),
    );
  }

  _buildAttachmentButtons() {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleButton(
            icon: Icons.photo_library_outlined,
            iconSize: 18.0,
            color: ColorPalette.primary,
            onPressed: () {},
          ),
          CircleButton(
            icon: Icons.play_circle_outline,
            iconSize: 18.0,
            onPressed: () {},
            color: ColorPalette.primary,
          ),
        ],
      ),
    );
  }
}
