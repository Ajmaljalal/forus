import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forus/widgets/responsive.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:forus/controllers/home_controllers/main_feed_controller.dart';
import 'package:forus/controllers/posts_controllers/create_new_post_controller.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/circled_button.dart';

class CreateNewPostModal extends StatefulWidget {
  CreateNewPostModal({Key? key}) : super(key: key);

  @override
  _CreateNewPostModalState createState() => _CreateNewPostModalState();
}

class _CreateNewPostModalState extends State<CreateNewPostModal> {
  final TextEditingController _postInputController = TextEditingController();
  final FocusNode _postInputFocusNode = FocusNode();

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
          mainAxisAlignment: Responsive.isDesktop(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildInputField(),
            const SizedBox(height: 5.0),
            ctl.images.length > 0
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [..._selectedPhotosHolder(ctl)],
                  )
                : const SizedBox.shrink(),
            ctl.video != null
                ? _selectedVideoHolder(ctl)
                : const SizedBox.shrink(),
            _buildActionButtons(context),
          ],
        );
      },
    );
  }

  Widget _buildInputField() {
    return Container(
      width: 500.0,
      height: 210.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _postInputController,
          maxLines: null,
          minLines: null,
          expands: true,
          autofocus: true,
          focusNode: _postInputFocusNode,
          decoration: InputDecoration(
            hintText: 'Speak out your mind!',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(context) {
    Get.put(MainFeedController());
    // final MainFeedController mainFeedCtl = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              _createAttachmentButton(
                icon: Icons.photo_library_outlined,
                tooltip: 'image from gallery',
                fileType: 'image',
                fileFrom: 'gallery',
              ),
              _createAttachmentButton(
                icon: Icons.camera_alt_outlined,
                tooltip: 'take a picture',
                fileType: 'image',
                fileFrom: 'camera',
              ),
              _createAttachmentButton(
                icon: Icons.play_circle_outline,
                tooltip: 'video from gallery',
                fileType: 'video',
                fileFrom: 'gallery',
              ),
              _createAttachmentButton(
                icon: Icons.videocam_outlined,
                tooltip: 'take a picture',
                fileType: 'video',
                fileFrom: 'camera',
              ),
            ],
          ),
          Row(
            children: [
              Responsive.isDesktop(context)
                  ? _createPostButton(
                      text: 'Cancel',
                      color: ColorPalette.secondary,
                      onTap: () {
                        Get.back();
                      },
                    )
                  : const SizedBox.shrink(),
              Responsive.isDesktop(context)
                  ? _createPostButton(
                      text: 'Post',
                      color: ColorPalette.primary,
                      onTap: () {
                        // mainFeedCtl.createNewPost();
                        Get.back();
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }

  _createPostButton({
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

  _createAttachmentButton({
    required IconData icon,
    String? tooltip,
    required String fileType,
    required String fileFrom,
  }) {
    final CreateNewPostController ctl = Get.find();
    return CircleButton(
      icon: icon,
      iconSize: 18.0,
      color: ColorPalette.primary,
      tooltip: tooltip,
      onPressed: () async {
        kIsWeb
            ? await ctl.pickFilesWeb(type: FileType.image)
            : await ctl.pickFileMobile(
                type: fileType,
                from: fileFrom,
              );
      },
    );
  }

  List _selectedPhotosHolder(ctl) {
    return ctl.images.map((image) {
      print('image grabbed');
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
                child: kIsWeb
                    ? Image.memory(
                        image,
                        height: 40.0,
                        width: 40.0,
                        filterQuality: FilterQuality.medium,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        image,
                        height: 40,
                        width: 40,
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

  Widget _selectedVideoHolder(ctl) {
    final video = ctl.video;
    if (video != null) {
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
                child: Text('video selected')),
            InkWell(
              onTap: () {
                // ctl.deletePickedFile(index);
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
  }
}
