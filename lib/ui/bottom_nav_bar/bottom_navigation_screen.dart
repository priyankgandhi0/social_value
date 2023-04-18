import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import '../../constant/app_string.dart';
import '../../theme/app_color.dart';
import '../../utils/Routes_manager.dart';
import '../../utils/custom_bottom_item.dart';

class BottomNaviBarScreen extends StatelessWidget {
  BottomNaviBarScreen({Key? key}) : super(key: key);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 80,
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          SizedBox(
            width: size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(IconsAssets.dashBoardIcon),
                    4.0.addHSpace(),
                    dashboard.interTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          selectedIndex = 1;
                          Get.toNamed(Routes.wellBeingHomeScreen);
                        },
                        child: SvgPicture.asset(IconsAssets.wellbeingIcon)),
                    4.0.addHSpace(),
                    wellbeing.interTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(IconsAssets.planetIcon),
                    // 1.0.addHSpace(),
                    Planet.interTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(IconsAssets.communityIcon),
                    4.0.addHSpace(),
                    community.interTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      IconsAssets.moreIcon,
                    ),
                    14.0.addHSpace(),
                    more.interTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.white)
                  ],
                ).paddingOnly(top: 14)
              ],
            ).paddingOnly(
              top: 25,
            ),
          )
        ],
      ),
    );
  }
}
