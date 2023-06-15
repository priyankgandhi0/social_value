import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';
import '../../../constant/shred_preference.dart';
import '../../../generated/assets.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/app_menuItem.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      backGround: white,
      color: darkGreen,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.0.addHSpace(),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (preferences.getString(SharedPreference.USER_PROFILE_IMAGE) ?? "").isNotEmpty
                      ? Image.network(
                          (preferences.getString(SharedPreference.USER_PROFILE_IMAGE) ?? ""),
                          fit: BoxFit.cover,
                          // width: 200,
                          // height: 200,
                        )
                      : Image.asset(
                          Assets.imagesProfile,
                          fit: BoxFit.cover,
                          // width: 200,
                          // height: 200,
                        ),
                ),
              ),
              20.0.addHSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (preferences.getString(SharedPreference.FIRST_NAME) ?? "")
                      .appEpilogueTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontColor: black),
                  2.0.addWSpace(),
                  (preferences.getString(SharedPreference.LAST_NAME) ?? "")
                      .appEpilogueTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontColor: black),
                ],
              ),
              47.0.addHSpace(),
              const Divider(
                color: Color(0xffE4E4E4),
                thickness: 1,
              ),
              AppMenuItem(
                  appImage: Assets.iconsMyProfile,
                  appItemText: myProfile,
                  itemOnTap: () {
                    Get.toNamed(Routes.myProfileScreen);
                  }),
              AppMenuItem(
                  appImage: Assets.iconsSettingIcon,
                  appItemText: settings,
                  itemOnTap: () {
                    Get.toNamed(Routes.staffSurveyScreen);
                  }),
              AppMenuItem(
                  appImage: Assets.iconsHelpIcon,
                  appItemText: help,
                  itemOnTap: () {
                    Get.toNamed(Routes.helpSupport);
                  }),
              AppMenuItem(
                  appImage: Assets.iconsTermsIcon,
                  appItemText: termsConditions,
                  itemOnTap: () {
                    Get.toNamed(Routes.termsCondition);
                  }),
              AppMenuItem(
                  appImage: Assets.iconsPrivacyIcon,
                  appItemText: privacyCentre,
                  itemOnTap: () {
                    Get.toNamed(Routes.privacyCenter);
                  }),
              40.0.addHSpace(),
              Container(
                height: 229,
                width: 398,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(1, 1),
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
                    Image.asset(Assets.imagesMemberLogo)
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
