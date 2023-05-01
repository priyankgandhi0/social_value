import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/home_card_const.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';
import '../../../constant/shred_preference.dart';
import '../../../generated/asset.dart';
import '../../../generated/assets.dart';
import '../../../theme/app_color.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_progress.dart';
import '../../../widgets/common_card.dart';
import '../../../widgets/home_screen_card.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';
import 'dashboard_contorller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  String name = preferences.getString(SharedPreference.FIRST_NAME) ?? "";
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      color: darkGreen,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: GetBuilder<DashboardController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getVideos("86"));
            }, builder: (context) {
              return Column(
                children: [
                  Container(
                    // height: Get.height / 2,
                    width: double.infinity,
                    color: darkGreen,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 16, right: 16),
                          child: SafeArea(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.menuScreen);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: (preferences.getString(
                                                          SharedPreference
                                                              .USER_PROFILE_IMAGE) ??
                                                      "")
                                                  .isNotEmpty
                                              ? Image.network(
                                                  (preferences.getString(
                                                          SharedPreference
                                                              .USER_PROFILE_IMAGE) ??
                                                      ""),
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
                                    ),
                                    16.0.addWSpace(),
                                    "Hi $name".appEpilogueTextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontColor: white)
                                  ],
                                ).paddingOnly(bottom: 5),
                                10.0.addHSpace(),
                                welComeText.appEpilogueTextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontColor: white),
                                11.0.addHSpace(),
                                Row(
                                  children: [
                                    welComeText.interTextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontColor: white,
                                    ),
                                  ],
                                ),
                                27.0.addHSpace(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    companyNameText.interTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontColor: white,
                                    ),
                                    soFarYouHaveHelpedPlantText.interTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontColor: white,
                                    ),
                                  ],
                                ),
                                4.0.addHSpace(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.socialValueScore);
                                      },
                                      child: Container(
                                        height: Get.height / 11.5,
                                        width: Get.width / 2.35,
                                        decoration: BoxDecoration(
                                            color: lightGreen,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 11,
                                              right: 11,
                                              top: 6,
                                              bottom: 6),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons75Rounder,
                                                height: 45,
                                                width: 45,
                                              ),
                                              2.0.addWSpace(),
                                              Expanded(
                                                  child: socialValueScoreText
                                                      .interTextStyle(
                                                          textAlign:
                                                              TextAlign.center,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: Get.height / 11.5,
                                      width: Get.width / 2.35,
                                      decoration: BoxDecoration(
                                          color: lightGreen,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 11,
                                            right: 11,
                                            top: 6,
                                            bottom: 6),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.iconsTree,
                                              height: 50,
                                              width: 50,
                                            ),
                                            2.0.addWSpace(),
                                            treeText.interTextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        18.0.addHSpace(),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Container(
                            height: 30,
                            // width: Get.size.width,
                            color: backGroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: backGroundColor,
                    ),
                    child: Column(children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              exploreText.interTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontColor: const Color(0xff000000))
                            ],
                          ).paddingOnly(left: 16, right: 16),
                          20.0.addHSpace(),
                          SizedBox(
                            height: 225,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeCard.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ExploreHubCard(
                                    color: homeCard[index].color,
                                    image: homeCard[index].image,
                                    hubDesc: homeCard[index].desc,
                                    hubName: homeCard[index].title);
                              },
                            ),
                          ).paddingOnly(left: 16, right: 16),
                          5.0.addHSpace(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: List.generate(
                          //       4,
                          //       (index) => const CircleAvatar(
                          //             backgroundColor: Color(0xffD9D9D9),
                          //             radius: 6,
                          //           ).paddingOnly(right: 3)),
                          // ),
                          20.0.addHSpace(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  Assets.imagesLesMills,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ).paddingOnly(left: 16, right: 16),
                          12.0.addHSpace(),
                          Row(
                            children: [
                              Expanded(
                                child: memberShipText.interTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontColor: textColor,
                                    maxLines: 2),
                              ),
                            ],
                          ).paddingOnly(left: 16, right: 16),
                          12.0.addHSpace(),
                          const MemberShipCard(
                            text: memberShipDesc,
                          ).paddingOnly(left: 16, right: 16),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Container(
                          //     height: 225,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(8)),
                          //     child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(8),
                          //       child: Image.asset(
                          //         ImageAssets.memberShip,
                          //         fit: BoxFit.cover,
                          //         height: 225,
                          //         width: double.infinity,
                          //       ),
                          //     ),
                          //   ),
                          // ).paddingOnly(left: 16, right: 16),
                          12.0.addHSpace(),
                          Row(
                            children: [
                              Expanded(
                                child: maximumMemberShipText.interTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontColor: textColor),
                              ),
                            ],
                          ).paddingOnly(left: 16, right: 16),
                          10.0.addHSpace(),
                          SizedBox(
                            height: 111,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const AppVideoCommonCard(
                                    image: Assets.imagesWorkoutImg);
                              },
                            ),
                          ).paddingOnly(left: 10, right: 10),

                          10.0.addHSpace(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: List.generate(
                          //       4,
                          //       (index) => const CircleAvatar(
                          //             backgroundColor: Color(0xffD9D9D9),
                          //             radius: 6,
                          //           ).paddingOnly(right: 3)),
                          // ),
                          15.0.addHSpace(),
                          SizedBox(
                            height: 210,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 210,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(Assets.imagesTree),
                                );
                              },
                            ),
                          ).paddingOnly(left: 16, right: 16),
                          15.0.addHSpace(),
                          Container(
                              padding: const EdgeInsets.all(10),
                              height: 250,
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ukBased.interTextStyle(
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w700,
                                      fontColor: textColor,
                                      fontSize: 16,
                                      maxLines: 2),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Image.asset(ImageAssets.shelterImage),
                                        Image.asset(ImageAssets.teensUnitsImage)
                                      ],
                                    ),
                                  ),
                                  15.0.addHSpace(),
                                  AppButton(
                                      text: "Find out more", onTap: () {}),
                                ],
                              )),
                        ],
                      ),
                      // GestureDetector(
                      //   onTap: () {},
                      // ),
                    ]),
                  )
                ],
              );
            }),
          ),
          Obx(() => controller.isLoading.value || controller.isLoading.value
              ? const AppProgress(
                  color: darkGreen,
                )
              : Container()),
        ],
      ),
    );
  }
}
