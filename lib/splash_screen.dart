import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';

import 'package:social_value/utils/routes_manager.dart';

import 'dart:async';

import 'constant/shred_preference.dart';
import 'generated/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onInit();
    return Scaffold(
      body: Container(
        color: darkGreen,
        height: Get.height,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        width: Get.size.width,
        child: Image.asset(
          Assets.imagesSpash,
          height: Get.height / 1.4,
          width: Get.width / 1.4,
        ).paddingOnly(left: 30, right: 30),
      ),
    );
  }

  _onInit() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      var isLogin = preferences.getBool(SharedPreference.IS_LOGGED_IN);
      if (isLogin == true) {
        // Get.offAllNamed(Routes.videoPlayerScreen);
        Get.offAllNamed(Routes.dashboardScreen);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }
  // _onInit() {
  //   Future.delayed(const Duration(seconds: 3)).then((value) async {
  //     Get.offAllNamed(Routes.login);
  //   });
  // }
}
