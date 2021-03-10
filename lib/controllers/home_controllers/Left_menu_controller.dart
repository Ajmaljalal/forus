import 'package:get/get.dart';

class LeftMenueController extends GetxController {
  var currentRout = 'home'.obs;

  changeRout({required rout}) {
    currentRout.value = rout;
    print(currentRout);
    // Get.toNamed('/$rout');
  }
}
