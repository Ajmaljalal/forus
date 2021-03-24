import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/controllers/home_controllers/bottom_nav_controller.dart';
import 'package:forus/views/shared_views/posts/create_new_post.dart';
import 'package:get/get.dart';

class CreateNewPostMobile extends StatelessWidget {
  const CreateNewPostMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavController ctl = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write a post',
          style: TextStyle(color: ColorPalette.secondary),
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: IconButton(
          onPressed: () {
            ctl.changeSelectedIndex(index: 0);
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          icon: Icon(Icons.close),
          color: ColorPalette.primary,
        ),
      ),
      body: CreateNewPostModal(),
    );
  }
}
