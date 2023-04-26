import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';

import '../../../generated/assets.dart';

import '../../../theme/app_color.dart';
import '../../../utils/routes_manager.dart';
import '../../../utils/custom_bottom_item.dart';

class BottomNaviBarScreen extends StatelessWidget {
  const BottomNaviBarScreen(
      {Key? key,
      required this.color,
      required this.child,
      this.appbar,
      this.backGround,
      this.bottomColor})
      : super(key: key);
  final Color color;
  final Color? bottomColor;
  final Color? backGround;
  final Widget child;
  final PreferredSizeWidget? appbar;

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGround ?? backGroundColor,
      appBar: appbar,
      body: Stack(
        children: [
          Padding(padding: const EdgeInsets.only(bottom: 65), child: child),
          if (isKeyboardOpen)
            const SizedBox()
          else
            ColorfulSafeArea(
              bottomColor: bottomColor ?? darkGreen,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 80,
                  width: Get.size.width,
                  child: CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(color),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.dashboardScreen);
                          },
                          child: Container(
                            height: 90,
                            // width: 70,
                            // padding: const EdgeInsets.only(left: 10, right: 10),
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.dashboardScreen);
                                    },
                                    child: SvgPicture.asset(
                                        Assets.iconsDashBoardIcon)),
                                4.0.addHSpace(),
                                dashboard.interTextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontColor: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.wellBeingDashBoardScreen);
                          },
                          child: Container(
                            height: 90,
                            // padding: const EdgeInsets.only(left: 10, right: 10),
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          Routes.wellBeingDashBoardScreen);
                                    },
                                    child: SvgPicture.asset(
                                      IconsAssets.wellbeingIcon,
                                      height: 30,
                                      color: Colors.white,
                                    )),
                                4.0.addHSpace(),
                                wellbeing.interTextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontColor: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.planetMain);
                          },
                          child: Container(
                            // padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 90,
                            // width: 70,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.planetMain);
                                    },
                                    child:
                                        SvgPicture.asset(Assets.iconsPlanet)),
                                2.0.addHSpace(),
                                planet.interTextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontColor: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.communityMain);
                          },
                          child: Container(
                            // padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 90,
                            // width: 70,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.communityMain);
                                    },
                                    child: SvgPicture.asset(
                                        IconsAssets.communityIcon)),
                                4.0.addHSpace(),
                                community.interTextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontColor: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.menuScreen);
                          },
                          child: Container(
                            // padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 90,
                            // width: 70,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.menuScreen);
                                  },
                                  child: SvgPicture.asset(
                                    Assets.iconsMore,
                                  ),
                                ),
                                14.0.addHSpace(),
                                more.interTextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontColor: Colors.white)
                              ],
                            ).paddingOnly(top: 14),
                          ),
                        )
                      ],
                    ).paddingOnly(
                      top: 25,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
