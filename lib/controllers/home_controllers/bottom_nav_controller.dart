import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  PageController pageController = PageController();

  changeSelectedIndex({required int index}) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    print(index);
    update();
  }
}
