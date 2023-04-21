import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentalHealthMainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void onInit() {
    controller = TabController(vsync: this, length: 7);
    super.onInit();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  RxInt currentIndex = 0.obs;
}
