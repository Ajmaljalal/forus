import 'package:get/get.dart';
import '../tabbars_controllers/left_side_bar_controller.dart';
import 'main_feed_controller.dart';
import 'bottom_nav_controller.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainFeedController>(() => MainFeedController());
    Get.lazyPut<LeftSideBarController>(() => LeftSideBarController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
