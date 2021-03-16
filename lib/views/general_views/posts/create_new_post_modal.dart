import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:forus/controllers/home_controllers/main_feed_controller.dart';
import 'package:forus/controllers/posts_controllers/create_new_post_controller.dart';
import 'package:forus/models/models.dart';
import 'package:forus/models/post.dart';
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
    return GetBuilder<CreateNewPostController>(
      init: CreateNewPostController(),
      builder: (ctl) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildInputField(),
            const SizedBox(height: 10.0),
            ctl.images.length != 0
                ? Row(children: [..._selectedPhotosVideosHolder(ctl)])
                : const SizedBox.shrink(),
            _buildActionButtons(),
          ],
        );
      },
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
    final MainFeedController mainFeedCtl = Get.find();
    final CreateNewPostController createPostCtl = Get.find();
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
                onTap: () async {
                  await createPostCtl.pickFiles(type: FileType.image);
                },
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
                  mainFeedCtl.createNewPost(
                    post: Post(
                      text: _postInputController.text,
                      likes: 0,
                      comments: 0,
                      imageUrl: 'https://picsum.photos/id/7/680/400',
                      shares: 0,
                      user: User(
                        imageUrl: 'https://picsum.photos/id/7/80',
                        name: 'Ajmal Jalal',
                      ),
                    ),
                  );
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
      onPressed: onTap,
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

  List _selectedPhotosVideosHolder(ctl) {
    return ctl.images.map((image) {
      final index = ctl.images.indexOf(image);
      if (image != null) {
        return Container(
          margin: const EdgeInsets.only(
            top: 5.0,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 4.0,
                ),
                child: Image.memory(
                  image,
                  height: 40.0,
                  width: 40.0,
                  filterQuality: FilterQuality.medium,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  ctl.deletePickedFile(index);
                },
                child: const Center(
                    child: const Icon(
                  Icons.remove_circle,
                  color: ColorPalette.secondary,
                )),
              )
            ],
          ),
        );
      } else
        return const SizedBox.shrink();
    }).toList();
  }
}
