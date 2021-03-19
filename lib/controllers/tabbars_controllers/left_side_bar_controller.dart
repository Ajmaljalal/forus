import 'package:get/get.dart';

class LeftSideBarController extends GetxController {
  String currentRout = 'Home';
  String innerRout = 'null';

  changeRout({required rout}) {
    currentRout = rout;
    update();
    // if (rout.toString().toLowerCase() == 'home') {
    //   Get.toNamed('/');
    // } else {
    //   final routName =
    //       '/${rout.replaceAll(RegExp(r"\s+"), "").toString().toLowerCase()}';
    //   Get.toNamed(routName);
    // }
  }

  changeInnerRout({required rout}) {
    innerRout = rout;
    update();
  }
}
