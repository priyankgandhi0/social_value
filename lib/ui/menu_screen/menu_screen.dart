import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

import '../../constant/app_string.dart';
import '../../widgets/app_drawer.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
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
            50.0.addHSpace(),
            AppDrawerItem(
                appImage: ImageAssets.profileImage,
                appItemText: myProfile,
                itemOnTap: () {}),
            AppDrawerItem(
                appImage: ImageAssets.profileImage,
                appItemText: settings,
                itemOnTap: () {}),
            AppDrawerItem(
                appImage: ImageAssets.profileImage,
                appItemText: help,
                itemOnTap: () {}),
            AppDrawerItem(
                appImage: ImageAssets.profileImage,
                appItemText: termsConditions,
                itemOnTap: () {}),
            AppDrawerItem(
                appImage: ImageAssets.profileImage,
                appItemText: privacyCentre,
                itemOnTap: () {})
          ],
        ),
      ),
    );
  }
}
