import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/circled_button.dart';

class CreateNewPostModal extends StatefulWidget {
  CreateNewPostModal({Key? key}) : super(key: key);

  @override
  _CreateNewPostModalState createState() => _CreateNewPostModalState();
}

class _CreateNewPostModalState extends State<CreateNewPostModal> {
  final TextEditingController _postInputController = TextEditingController();

  @override
  void dispose() {
    _postInputController.dispose();
    super.dispose();
  }

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
          width: 500.0,
          height: 250.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _postInputController,
              maxLines: null,
              minLines: null,
              expands: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Speak out your mind!',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
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
              _createPostButton(
                icon: Icons.photo_library_outlined,
                onTap: () {},
              ),
              _createPostButton(
                icon: Icons.play_circle_outline,
                onTap: () {},
              ),
              _createPostButton(
                icon: Icons.emoji_emotions_outlined,
                onTap: () {},
              ),
            ],
          ),
          Row(
            children: [
              _createAttachmentButton(
                text: 'Cancel',
                color: ColorPalette.secondary,
                onTap: () {
                  Get.back();
                },
              ),
              _createAttachmentButton(
                text: 'Post',
                color: ColorPalette.primary,
                onTap: () {
                  print(_postInputController.text);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _createAttachmentButton({
    required String text,
    required Function()? onTap,
    required color,
  }) {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(primary: color),
    );
  }

  _createPostButton({
    required Function() onTap,
    required IconData icon,
  }) {
    return CircleButton(
      icon: icon,
      iconSize: 18.0,
      color: ColorPalette.primary,
      onPressed: onTap,
    );
  }
}
