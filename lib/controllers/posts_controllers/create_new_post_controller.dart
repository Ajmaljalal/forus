import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewPostController extends GetxController {
  bool createPostInProgress = true;
  List images = [];
  var video;

  // createNewPost({required Post post}) async {
  //   posts.toList().add(post);
  //   createPostInProgress = false;
  // }

  Future pickFileMobile({
    required String type,
    required String from,
  }) async {
    final _picker = ImagePicker();
    var _source = from == 'gallery' ? ImageSource.gallery : ImageSource.camera;
    try {
      final pickedFile = type == 'image'
          ? await _picker.getImage(
              source: _source,
              imageQuality: 80,
            )
          : await _picker.getVideo(
              source: _source,
              preferredCameraDevice: CameraDevice.rear,
            );
      if (pickedFile != null) {
        final File file = File(pickedFile.path);
        type == 'image'? images.add(file) : video = file;
        update();
      }
    } catch (error) {
      throw (error);
    }
  }

  void deletePickedFile(index) {
    images.removeAt(index);
    update();
  }
}
