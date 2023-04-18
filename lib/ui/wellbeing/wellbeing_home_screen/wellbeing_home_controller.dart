import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void onInit() {
    controller = TabController(vsync: this, length: 4);
    super.onInit();
  }

  RxInt currentIndex = 0.obs;
}
