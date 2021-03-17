import 'package:get/get.dart';
import 'package:forus/controllers/home_controllers/Left_menu_controller.dart';
import 'package:forus/controllers/home_controllers/main_feed_controller.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainFeedController>(() => MainFeedController());
    Get.lazyPut<LeftMenueController>(() => LeftMenueController());
  }
}
