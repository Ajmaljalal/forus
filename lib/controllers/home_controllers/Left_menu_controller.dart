import 'package:get/get.dart';

class LeftMenueController extends GetxController {
  String currentRout = 'Home';

  changeRout({required rout}) {
    currentRout = rout;
    print(currentRout);
    update();
    // Get.toNamed('/$rout');
  }
}
