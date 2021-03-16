import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class CreateNewPostController extends GetxController {
  bool createPostInProgress = true;
  List images = [];

  // createNewPost({required Post post}) async {
  //   posts.toList().add(post);
  //   createPostInProgress = false;
  // }

  Future<void> pickFiles({required FileType type}) async {
    var picked = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: type,
    );
    if (picked != null) {
      picked.files.map((file) => images.add(file.bytes)).toList();
      update();
    }
  }

  void deletePickedFile(index) {
    images.removeAt(index);
    update();
  }
}
