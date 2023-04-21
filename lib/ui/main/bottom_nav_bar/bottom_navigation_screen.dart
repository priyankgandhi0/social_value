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

// class BottomNaviBarScreen extends StatelessWidget {
//   BottomNaviBarScreen({Key? key, required this.color}) : super(key: key);
//   final Color color;
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return SizedBox(
//       width: size.width,
//       height: 80,
//       child: Stack(
//         // overflow: Overflow.visible,
//         children: [
//           CustomPaint(
//             size: Size(size.width, 80),
//             painter: BNBCustomPainter(color),
//           ),
//           SizedBox(
//             width: size.width,
//             height: 80,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Get.toNamed(Routes.homeScreen);
//                         },
//                         child: SvgPicture.asset(IconsAssets.dashBoardIcon)),
//                     4.0.addHSpace(),
//                     dashboard.interTextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontColor: Colors.white)
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Get.toNamed(Routes.wellBeingHomeScreen);
//                         },
//                         child: SvgPicture.asset(IconsAssets.wellbeingIcon)),
//                     4.0.addHSpace(),
//                     wellbeing.interTextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontColor: Colors.white)
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Get.toNamed(Routes.physicalHealthHomeScreen);
//                         },
//                         child: SvgPicture.asset(IconsAssets.planetIcon)),
//                     // 1.0.addHSpace(),
//                     Planet.interTextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontColor: Colors.white)
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                         onTap: () {},
//                         child: SvgPicture.asset(IconsAssets.communityIcon)),
//                     4.0.addHSpace(),
//                     community.interTextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontColor: Colors.white)
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: SvgPicture.asset(
//                         IconsAssets.moreIcon,
//                       ),
//                     ),
//                     14.0.addHSpace(),
//                     more.interTextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontColor: Colors.white)
//                   ],
//                 ).paddingOnly(top: 14)
//               ],
//             ).paddingOnly(
//               top: 25,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class BottomNaviBarScreen extends StatelessWidget {
  const BottomNaviBarScreen(
      {Key? key, required this.color, required this.child, this.appbar})
      : super(key: key);
  final Color color;
  final Widget child;
  final PreferredSizeWidget? appbar;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: appbar,
      body: Stack(
        children: [
          Padding(padding: const EdgeInsets.only(bottom: 65), child: child),
          Align(
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
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.dashboardScreen);
                            },
                            child: SvgPicture.asset(Assets.iconsDashBoardIcon)),
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
                              Get.toNamed(Routes.wellBeingDashBoardScreen);
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
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(Assets.iconsPlanet)),
                        // 1.0.addHSpace(),
                        Planet.interTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontColor: Colors.white)
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(Assets.iconsCommunity)),
                        4.0.addHSpace(),
                        community.interTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontColor: Colors.white)
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
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
                    ).paddingOnly(top: 14)
                  ],
                ).paddingOnly(
                  top: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
