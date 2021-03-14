import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:get/get.dart';

class CreateNewPostModal extends StatefulWidget {
  CreateNewPostModal({Key? key}) : super(key: key);

  @override
  _CreateNewPostModalState createState() => _CreateNewPostModalState();
}

class _CreateNewPostModalState extends State<CreateNewPostModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInputField(),
        const SizedBox(height: 10.0),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildInputField() {
    return Center(
      child: Material(
        child: Container(
          width: 600.0,
          height: 250.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: null,
              minLines: null,
              expands: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Speak out your mind!',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
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
                color: ColorPalette.primary,
                onPressed: () {},
              ),
              CircleButton(
                icon: Icons.emoji_emotions_outlined,
                iconSize: 18.0,
                color: ColorPalette.primary,
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(primary: ColorPalette.secondary),
              ),
              const SizedBox(width: 8.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(primary: ColorPalette.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
