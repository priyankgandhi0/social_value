import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/theme/app_color.dart';

import 'package:social_value/utils/extension.dart';

import '../../../constant/app_string.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/app_menuItem.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      color: darkGreen,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.0.addHSpace(),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:
                      // (preferences.getString(SharedPreference
                      //     .USER_PROFILE_IMAGE) ??
                      //     "")
                      //     .isNotEmpty
                      //     ? Image.network(
                      //   AppUrls.profileImage +
                      //       (preferences.getString(SharedPreference
                      //           .USER_PROFILE_IMAGE) ??
                      //           ""),
                      //   fit: BoxFit.cover,
                      //   // width: 200,
                      //   // height: 200,
                      // )
                      //     :
                      Image.asset(
                    ImageAssets.profileImage,
                    fit: BoxFit.cover,
                    // width: 200,
                    // height: 200,
                  ),
                ),
              ),
              20.0.addHSpace(),
              "Debbie Dallas".appEpilogueTextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, fontColor: black),
              47.0.addHSpace(),
              const Divider(
                color: Color(0xffE4E4E4),
                thickness: 1,
              ),
              AppMenuItem(
                  appImage: IconsAssets.myProfile,
                  appItemText: myProfile,
                  itemOnTap: () {
                    Get.toNamed(Routes.homeScreen);
                  }),
              AppMenuItem(
                  appImage: IconsAssets.settingIcon,
                  appItemText: settings,
                  itemOnTap: () {}),
              AppMenuItem(
                  appImage: IconsAssets.supportIcon,
                  appItemText: help,
                  itemOnTap: () {}),
              AppMenuItem(
                  appImage: IconsAssets.termsIcon,
                  appItemText: termsConditions,
                  itemOnTap: () {}),
              AppMenuItem(
                  appImage: IconsAssets.privacyIcon,
                  appItemText: privacyCentre,
                  itemOnTap: () {}),
              40.0.addHSpace(),
              Container(
                height: 229,
                width: 398,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          // spreadRadius: 1,
                          blurRadius: 2)
                    ],
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    36.0.addHSpace(),
                    memberSinceText.interTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    27.0.addHSpace(),
                    Image.asset(ImageAssets.memberLogo)
                  ],
                ),
              ).paddingOnly(left: 16, right: 16, bottom: 40)
            ],
          ),
        ),
      ),
    );
  }
}
