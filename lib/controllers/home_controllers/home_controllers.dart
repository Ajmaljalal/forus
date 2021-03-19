import 'package:get/get.dart';
import 'package:forus/controllers/tabbars_controllers/left_side_bar_controller.dart';
import 'package:forus/controllers/home_controllers/main_feed_controller.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainFeedController>(() => MainFeedController());
    Get.lazyPut<LeftSideBarController>(() => LeftSideBarController());
  }
}
