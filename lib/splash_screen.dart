import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';

import 'package:social_value/utils/routes_manager.dart';

import 'dart:async';

import 'constant/shred_preference.dart';
import 'generated/asset.dart';
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
        // child: Image.asset(ImageAssets.spashImage, height: Get.height / 1.4, width: Get.width / 1.4).paddingOnly(left: 30, right: 30),
        child: LimitedBox(
          maxHeight: 100,
          maxWidth: 100,
          child: SvgPicture.asset(
              'assets/icons/splashIcon.svg',
              height: Get.height / 1.4, width: Get.width / 1.4).paddingOnly(left: 30, right: 30),
        ),
      ),
    );
  }

  _onInit() {
    Future.delayed(const Duration(seconds: 3)).then((value)  {
      var isLogin = preferences.getBool(SharedPreference.IS_LOGGED_IN);
      if (isLogin == true) {
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
