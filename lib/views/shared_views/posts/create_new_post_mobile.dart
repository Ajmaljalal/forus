import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/views/shared_views/posts/create_new_post.dart';
import 'package:get/get.dart';

class CreateNewPostMobile extends StatelessWidget {
  const CreateNewPostMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'POST',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              style: TextButton.styleFrom(primary: ColorPalette.secondary),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
          color: ColorPalette.primary,
        ),
      ),
      body: CreateNewPostModal(),
    );
  }
}
