import 'package:get/get.dart';

class LeftMenueController extends GetxController {
  String currentRout = 'Home';

  changeRout({required rout}) {
    currentRout = rout;
    update();
    if (rout.toString().toLowerCase() == 'home') {
      Get.toNamed('/');
    } else {
      final routName =
          '/${rout.replaceAll(RegExp(r"\s+"), "").toString().toLowerCase()}';
      Get.toNamed(routName);
    }
  }
}
