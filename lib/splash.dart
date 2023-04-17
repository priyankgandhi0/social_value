import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitapp/generated/assets.dart';

import 'global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isLogin = preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false;

    //   Settings.clearCache();

    super.initState();
    // !isHistory
    Timer(const Duration(seconds: 2), () {
      //   isHistory = true;
      //
      isLogin
          ? Get.offAllNamed(Routes.messageScreen)
          : Get.offAllNamed(Routes.welcomeScreen);
    });
    //     : null;
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLogin = preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false;
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          height: Get.height,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          width: Get.size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesSplash), fit: BoxFit.cover),
          ),
          child: Center(
            child: Image.asset(
              Assets.iconsAppIcon,
              height: Get.height / 1.4,
              width: Get.width / 1.4,
            ).pOnly(left: 30, right: 30),
          ),
        ),
      ),
    );
  }
}
