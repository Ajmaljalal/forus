import 'package:forus/mock/data.dart';
import 'package:forus/models/models.dart';
import 'package:get/get.dart';

class MainFeedController extends GetxController {
  List<Post> newsFeedPosts = [];

  fetchPosts() {
    //TODO: make an api call here using the services
    posts.map((e) => newsFeedPosts.add(e)).toList();
    update();
  }

  createNewPost({required Post post}) async {
    //TODO: make an api call here using the services
    newsFeedPosts.add(post);
    print(newsFeedPosts);
    update();
    Get.back();
  }
}
