import 'package:forus/mock/data.dart';
import 'package:forus/models/models.dart';
import 'package:get/get.dart';

class MainFeedController extends GetxController {
  List<Post> newsFeedPosts = [];

  fetchPosts() {
    posts.map((e) => newsFeedPosts.add(e)).toList();
    update();
  }

  createNewPost({required Post post}) async {
    newsFeedPosts.add(post);
    print(newsFeedPosts);
    update();
  }
}
