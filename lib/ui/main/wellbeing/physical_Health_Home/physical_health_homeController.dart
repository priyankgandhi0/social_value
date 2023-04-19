import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class PhysicalHealthHomeController extends GetxController
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
