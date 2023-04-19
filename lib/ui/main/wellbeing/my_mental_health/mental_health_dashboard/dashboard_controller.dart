import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentalHealthDashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void onInit() {
    controller = TabController(vsync: this, length: 6);
    super.onInit();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  RxInt currentIndex = 0.obs;
}
