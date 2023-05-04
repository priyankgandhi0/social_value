import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PlanetMainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void onInit() {
    controller = TabController(vsync: this, length: 4);

    super.onInit();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
