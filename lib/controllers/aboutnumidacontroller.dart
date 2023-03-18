import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  var currentIndex = 0;
  final PageController pageController = PageController(
      initialPage: 0,
      viewportFraction: 1
  );
  void setScreen(index) {
    currentIndex = index;
    update();
  }

}
