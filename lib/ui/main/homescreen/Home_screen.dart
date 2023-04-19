import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:social_value/utils/extension.dart';

import '../../../constant/app_string.dart';
import '../../../generated/asset.dart';
import '../../../theme/app_color.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/home_screen_card.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      color: darkGreen,
      /*  appbar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        automaticallyImplyLeading: false,
        // title: Row(
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         Get.toNamed(Routes.menuScreen);
        //       },
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.circle,
        //         ),
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(50),
        //           child:
        //           // (preferences.getString(SharedPreference
        //           //     .USER_PROFILE_IMAGE) ??
        //           //     "")
        //           //     .isNotEmpty
        //           //     ? Image.network(
        //           //   AppUrls.profileImage +
        //           //       (preferences.getString(SharedPreference
        //           //           .USER_PROFILE_IMAGE) ??
        //           //           ""),
        //           //   fit: BoxFit.cover,
        //           //   // width: 200,
        //           //   // height: 200,
        //           // )
        //           //     :
        //           Image.asset(
        //             ImageAssets.profileImage,
        //             fit: BoxFit.cover,
        //             // width: 200,
        //             // height: 200,
        //           ),
        //         ),
        //       ),
        //     ),
        //     16.0.addWSpace(),
        //     "Hi Debbie".appEpilogueTextStyle(
        //         fontSize: 20, fontWeight: FontWeight.w600, fontColor: white)
        //   ],
        // ).paddingOnly(bottom: 5),
      ),*/
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: Get.height / 2,
              width: double.infinity,
              color: darkGreen,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 16, right: 16),
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
                              ),
                              16.0.addWSpace(),
                              "Hi Debbie".appEpilogueTextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontColor: white)
                            ],
                          ).paddingOnly(bottom: 5),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Get.height / 11.5,
                                width: Get.width / 2.35,
                                decoration: BoxDecoration(
                                    color: lightGreen,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, right: 11, top: 6, bottom: 6),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.roundIcon,
                                        height: 50,
                                        width: 50,
                                      ),
                                      2.0.addWSpace(),
                                      socialValueScoreText.interTextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height / 11.5,
                                width: Get.width / 2.35,
                                decoration: BoxDecoration(
                                    color: lightGreen,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, right: 11, top: 6, bottom: 6),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconsAssets.treeIcon,
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
                  8.0.addHSpace(),
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          exploreText.interTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontColor: const Color(0xff000000))
                        ],
                      ),
                      20.0.addHSpace(),
                      SizedBox(
                        height: 210,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const ExploreHubCard(
                              image: ImageAssets.ladyImage,
                              hubDesc: wellbeingHubText,
                              hubName: wellbeingHub,
                            );
                          },
                        ),
                      ),
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
                              ImageAssets.ladyImage1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
                      ),
                      12.0.addHSpace(),
                      const MemberShipCard(
                        text: memberShipDesc,
                      ),
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
                      // ),
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
                      ),
                      10.0.addHSpace(),
                      SizedBox(
                        height: 111,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 111,
                              width: 188,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 2,
                                        // spreadRadius: 2,
                                        offset: const Offset(1, 0))
                                  ],
                                  color: white,
                                  borderRadius: BorderRadius.circular(8)),
                            );
                          },
                        ),
                      ),
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
                              child: Image.asset(ImageAssets.tree),
                            );
                          },
                        ),
                      ),
                      15.0.addHSpace(),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {},
                // ),
              ]),
            )
          ],
        ),
      ),
    );
    // Scaffold(
    // bottomNavigationBar: BottomNaviBarScreen1(
    //   color: darkGreen,
    //   child: Stack(
    //     children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           SizedBox(
    //             height: Get.height / 2,
    //             child: Container(
    //               height: Get.height / 2,
    //               width: double.infinity,
    //               color: darkGreen,
    //               child: Padding(
    //                 padding:
    //                     const EdgeInsets.only(top: 10, left: 16, right: 16),
    //                 child: SafeArea(
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           GestureDetector(
    //                             onTap: () {
    //                               Get.toNamed(Routes.menuScreen);
    //                             },
    //                             child: Container(
    //                               height: 50,
    //                               width: 50,
    //                               decoration: const BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                               ),
    //                               child: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(50),
    //                                 child:
    //                                     // (preferences.getString(SharedPreference
    //                                     //     .USER_PROFILE_IMAGE) ??
    //                                     //     "")
    //                                     //     .isNotEmpty
    //                                     //     ? Image.network(
    //                                     //   AppUrls.profileImage +
    //                                     //       (preferences.getString(SharedPreference
    //                                     //           .USER_PROFILE_IMAGE) ??
    //                                     //           ""),
    //                                     //   fit: BoxFit.cover,
    //                                     //   // width: 200,
    //                                     //   // height: 200,
    //                                     // )
    //                                     //     :
    //                                     Image.asset(
    //                                   ImageAssets.profileImage,
    //                                   fit: BoxFit.cover,
    //                                   // width: 200,
    //                                   // height: 200,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           16.0.addWSpace(),
    //                           "Hi Debbie".appEpilogueTextStyle(
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.w600,
    //                               fontColor: white)
    //                         ],
    //                       ),
    //                       16.0.addHSpace(),
    //                       welComeText.appEpilogueTextStyle(
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.w600,
    //                           fontColor: white),
    //                       11.0.addHSpace(),
    //                       Row(
    //                         children: [
    //                           welComeText.interTextStyle(
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w400,
    //                             fontColor: white,
    //                           ),
    //                         ],
    //                       ),
    //                       27.0.addHSpace(),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           companyNameText.interTextStyle(
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400,
    //                             fontColor: white,
    //                           ),
    //                           soFarYouHaveHelpedPlantText.interTextStyle(
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400,
    //                             fontColor: white,
    //                           ),
    //                         ],
    //                       ),
    //                       4.0.addHSpace(),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Container(
    //                             height: Get.height / 11.5,
    //                             width: Get.width / 2.35,
    //                             decoration: BoxDecoration(
    //                                 color: lightGreen,
    //                                 borderRadius: BorderRadius.circular(16)),
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   left: 11, right: 11, top: 6, bottom: 6),
    //                               child: Row(
    //                                 children: [
    //                                   SvgPicture.asset(
    //                                     ImageAssets.roundIcon,
    //                                     height: 50,
    //                                     width: 50,
    //                                   ),
    //                                   2.0.addWSpace(),
    //                                   socialValueScoreText.interTextStyle(
    //                                       fontWeight: FontWeight.w400,
    //                                       fontSize: 16)
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                           Container(
    //                             height: Get.height / 11.5,
    //                             width: Get.width / 2.35,
    //                             decoration: BoxDecoration(
    //                                 color: lightGreen,
    //                                 borderRadius: BorderRadius.circular(16)),
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   left: 11, right: 11, top: 6, bottom: 6),
    //                               child: Row(
    //                                 children: [
    //                                   SvgPicture.asset(
    //                                     IconsAssets.treeIcon,
    //                                     height: 50,
    //                                     width: 50,
    //                                   ),
    //                                   2.0.addWSpace(),
    //                                   treeText.interTextStyle(
    //                                       fontWeight: FontWeight.w400,
    //                                       fontSize: 16)
    //                                 ],
    //                               ),
    //                             ),
    //                           )
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           ClipRRect(
    //             borderRadius: const BorderRadius.only(
    //                 topLeft: Radius.circular(30),
    //                 topRight: Radius.circular(30)),
    //             child: Container(
    //               height: 380,
    //               decoration: const BoxDecoration(
    //                 color: backGroundColor,
    //               ),
    //               child: SingleChildScrollView(
    //                   child: Column(
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.only(
    //                           top: 28,
    //                           left: 16,
    //                           right: 16,
    //                         ),
    //                         child: Column(
    //                           children: [
    //                             Row(
    //                               children: [
    //                                 exploreText.interTextStyle(
    //                                     fontSize: 16,
    //                                     fontWeight: FontWeight.w700,
    //                                     fontColor: const Color(0xff000000))
    //                               ],
    //                             ),
    //                             20.0.addHSpace(),
    //                             SizedBox(
    //                               height: 210,
    //                               child: ListView.builder(
    //                                 scrollDirection: Axis.horizontal,
    //                                 itemCount: 4,
    //                                 shrinkWrap: true,
    //                                 itemBuilder: (context, index) {
    //                                   return const ExploreHubCard(
    //                                     image: ImageAssets.ladyImage,
    //                                     hubDesc: wellbeingHubText,
    //                                     hubName: wellbeingHub,
    //                                   );
    //                                 },
    //                               ),
    //                             ),
    //                             5.0.addHSpace(),
    //                             Row(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: List.generate(
    //                                   4,
    //                                   (index) => const CircleAvatar(
    //                                         backgroundColor:
    //                                             Color(0xffD9D9D9),
    //                                         radius: 6,
    //                                       ).paddingOnly(right: 3)),
    //                             ),
    //                             20.0.addHSpace(),
    //                             GestureDetector(
    //                               onTap: () {},
    //                               child: Container(
    //                                 height: 300,
    //                                 width: double.infinity,
    //                                 decoration: BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(10),
    //                                     color: Colors.grey),
    //                                 child: ClipRRect(
    //                                   borderRadius: BorderRadius.circular(10),
    //                                   child: Image.asset(
    //                                     ImageAssets.ladyImage1,
    //                                     fit: BoxFit.cover,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             12.0.addHSpace(),
    //                             Row(
    //                               children: [
    //                                 memberShipText.interTextStyle(
    //                                     fontWeight: FontWeight.w700,
    //                                     fontSize: 16,
    //                                     fontColor: textColor),
    //                               ],
    //                             ),
    //                             12.0.addHSpace(),
    //                             GestureDetector(
    //                               onTap: () {},
    //                               child: Container(
    //                                 height: 225,
    //                                 width: double.infinity,
    //                                 decoration: BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(8)),
    //                                 child: ClipRRect(
    //                                   borderRadius: BorderRadius.circular(8),
    //                                   child: Image.asset(
    //                                     ImageAssets.memberShip,
    //                                     fit: BoxFit.cover,
    //                                     height: 225,
    //                                     width: double.infinity,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             12.0.addHSpace(),
    //                             Row(
    //                               children: [
    //                                 maximumMemberShipText.interTextStyle(
    //                                     fontWeight: FontWeight.w700,
    //                                     fontSize: 16,
    //                                     fontColor: textColor),
    //                               ],
    //                             ),
    //                             10.0.addHSpace(),
    //                             SizedBox(
    //                               height: 111,
    //                               child: ListView.builder(
    //                                 scrollDirection: Axis.horizontal,
    //                                 itemCount: 4,
    //                                 shrinkWrap: true,
    //                                 itemBuilder: (context, index) {
    //                                   return Container(
    //                                     margin:
    //                                         const EdgeInsets.only(right: 10),
    //                                     height: 111,
    //                                     width: 188,
    //                                     decoration: BoxDecoration(
    //                                         boxShadow: [
    //                                           BoxShadow(
    //                                               color: Colors.grey.shade400,
    //                                               blurRadius: 2,
    //                                               // spreadRadius: 2,
    //                                               offset: const Offset(1, 0))
    //                                         ],
    //                                         color: white,
    //                                         borderRadius:
    //                                             BorderRadius.circular(8)),
    //                                   );
    //                                 },
    //                               ),
    //                             ),
    //                             10.0.addHSpace(),
    //                             Row(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: List.generate(
    //                                   4,
    //                                   (index) => const CircleAvatar(
    //                                         backgroundColor:
    //                                             Color(0xffD9D9D9),
    //                                         radius: 6,
    //                                       ).paddingOnly(right: 3)),
    //                             ),
    //                             15.0.addHSpace(),
    //                             SizedBox(
    //                               height: 210,
    //                               child: ListView.builder(
    //                                 scrollDirection: Axis.horizontal,
    //                                 itemCount: 4,
    //                                 shrinkWrap: true,
    //                                 itemBuilder: (context, index) {
    //                                   return Container(
    //                                     height: 210,
    //                                     width: 170,
    //                                     decoration: BoxDecoration(
    //                                       borderRadius:
    //                                           BorderRadius.circular(10),
    //                                     ),
    //                                     child: Image.asset(ImageAssets.tree),
    //                                   );
    //                                 },
    //                               ),
    //                             ),
    //                             15.0.addHSpace(),
    //                           ],
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                   Column(
    //                     children: [
    //                       GestureDetector(
    //                           onTap: () {},
    //                           child: Image.asset(ImageAssets.charityImage)),
    //                     ],
    //                   )
    //                 ],
    //               )),
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // ),
    // body: Stack(
    //   children: [
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           height: Get.height / 2,
    //           child: Container(
    //             height: Get.height / 2,
    //             width: double.infinity,
    //             color: darkGreen,
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.only(top: 10, left: 16, right: 16),
    //               child: SafeArea(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         GestureDetector(
    //                           onTap: () {
    //                             Get.toNamed(Routes.menuScreen);
    //                           },
    //                           child: Container(
    //                             height: 50,
    //                             width: 50,
    //                             decoration: const BoxDecoration(
    //                               shape: BoxShape.circle,
    //                             ),
    //                             child: ClipRRect(
    //                               borderRadius: BorderRadius.circular(50),
    //                               child:
    //                                   // (preferences.getString(SharedPreference
    //                                   //     .USER_PROFILE_IMAGE) ??
    //                                   //     "")
    //                                   //     .isNotEmpty
    //                                   //     ? Image.network(
    //                                   //   AppUrls.profileImage +
    //                                   //       (preferences.getString(SharedPreference
    //                                   //           .USER_PROFILE_IMAGE) ??
    //                                   //           ""),
    //                                   //   fit: BoxFit.cover,
    //                                   //   // width: 200,
    //                                   //   // height: 200,
    //                                   // )
    //                                   //     :
    //                                   Image.asset(
    //                                 ImageAssets.profileImage,
    //                                 fit: BoxFit.cover,
    //                                 // width: 200,
    //                                 // height: 200,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         16.0.addWSpace(),
    //                         "Hi Debbie".appEpilogueTextStyle(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w600,
    //                             fontColor: white)
    //                       ],
    //                     ),
    //                     16.0.addHSpace(),
    //                     welComeText.appEpilogueTextStyle(
    //                         fontSize: 24,
    //                         fontWeight: FontWeight.w600,
    //                         fontColor: white),
    //                     11.0.addHSpace(),
    //                     Row(
    //                       children: [
    //                         welComeText.interTextStyle(
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.w400,
    //                           fontColor: white,
    //                         ),
    //                       ],
    //                     ),
    //                     27.0.addHSpace(),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         companyNameText.interTextStyle(
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w400,
    //                           fontColor: white,
    //                         ),
    //                         soFarYouHaveHelpedPlantText.interTextStyle(
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w400,
    //                           fontColor: white,
    //                         ),
    //                       ],
    //                     ),
    //                     4.0.addHSpace(),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Container(
    //                           height: Get.height / 11.5,
    //                           width: Get.width / 2.35,
    //                           decoration: BoxDecoration(
    //                               color: lightGreen,
    //                               borderRadius: BorderRadius.circular(16)),
    //                           child: Padding(
    //                             padding: const EdgeInsets.only(
    //                                 left: 11, right: 11, top: 6, bottom: 6),
    //                             child: Row(
    //                               children: [
    //                                 SvgPicture.asset(
    //                                   ImageAssets.roundIcon,
    //                                   height: 50,
    //                                   width: 50,
    //                                 ),
    //                                 2.0.addWSpace(),
    //                                 socialValueScoreText.interTextStyle(
    //                                     fontWeight: FontWeight.w400,
    //                                     fontSize: 16)
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           height: Get.height / 11.5,
    //                           width: Get.width / 2.35,
    //                           decoration: BoxDecoration(
    //                               color: lightGreen,
    //                               borderRadius: BorderRadius.circular(16)),
    //                           child: Padding(
    //                             padding: const EdgeInsets.only(
    //                                 left: 11, right: 11, top: 6, bottom: 6),
    //                             child: Row(
    //                               children: [
    //                                 SvgPicture.asset(
    //                                   IconsAssets.treeIcon,
    //                                   height: 50,
    //                                   width: 50,
    //                                 ),
    //                                 2.0.addWSpace(),
    //                                 treeText.interTextStyle(
    //                                     fontWeight: FontWeight.w400,
    //                                     fontSize: 16)
    //                               ],
    //                             ),
    //                           ),
    //                         )
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         ClipRRect(
    //           borderRadius: const BorderRadius.only(
    //               topLeft: Radius.circular(30),
    //               topRight: Radius.circular(30)),
    //           child: Container(
    //             height: 380,
    //             decoration: const BoxDecoration(
    //               color: backGroundColor,
    //             ),
    //             child: SingleChildScrollView(
    //                 child: Column(
    //               children: [
    //                 Column(
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(
    //                         top: 28,
    //                         left: 16,
    //                         right: 16,
    //                       ),
    //                       child: Column(
    //                         children: [
    //                           Row(
    //                             children: [
    //                               exploreText.interTextStyle(
    //                                   fontSize: 16,
    //                                   fontWeight: FontWeight.w700,
    //                                   fontColor: const Color(0xff000000))
    //                             ],
    //                           ),
    //                           20.0.addHSpace(),
    //                           SizedBox(
    //                             height: 210,
    //                             child: ListView.builder(
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: 4,
    //                               shrinkWrap: true,
    //                               itemBuilder: (context, index) {
    //                                 return const ExploreHubCard(
    //                                   image: ImageAssets.ladyImage,
    //                                   hubDesc: wellbeingHubText,
    //                                   hubName: wellbeingHub,
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                           5.0.addHSpace(),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: List.generate(
    //                                 4,
    //                                 (index) => const CircleAvatar(
    //                                       backgroundColor: Color(0xffD9D9D9),
    //                                       radius: 6,
    //                                     ).paddingOnly(right: 3)),
    //                           ),
    //                           20.0.addHSpace(),
    //                           GestureDetector(
    //                             onTap: () {},
    //                             child: Container(
    //                               height: 300,
    //                               width: double.infinity,
    //                               decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.circular(10),
    //                                   color: Colors.grey),
    //                               child: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 child: Image.asset(
    //                                   ImageAssets.ladyImage1,
    //                                   fit: BoxFit.cover,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           12.0.addHSpace(),
    //                           Row(
    //                             children: [
    //                               memberShipText.interTextStyle(
    //                                   fontWeight: FontWeight.w700,
    //                                   fontSize: 16,
    //                                   fontColor: textColor),
    //                             ],
    //                           ),
    //                           12.0.addHSpace(),
    //                           GestureDetector(
    //                             onTap: () {},
    //                             child: Container(
    //                               height: 225,
    //                               width: double.infinity,
    //                               decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.circular(8)),
    //                               child: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(8),
    //                                 child: Image.asset(
    //                                   ImageAssets.memberShip,
    //                                   fit: BoxFit.cover,
    //                                   height: 225,
    //                                   width: double.infinity,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           12.0.addHSpace(),
    //                           Row(
    //                             children: [
    //                               maximumMemberShipText.interTextStyle(
    //                                   fontWeight: FontWeight.w700,
    //                                   fontSize: 16,
    //                                   fontColor: textColor),
    //                             ],
    //                           ),
    //                           10.0.addHSpace(),
    //                           SizedBox(
    //                             height: 111,
    //                             child: ListView.builder(
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: 4,
    //                               shrinkWrap: true,
    //                               itemBuilder: (context, index) {
    //                                 return Container(
    //                                   margin:
    //                                       const EdgeInsets.only(right: 10),
    //                                   height: 111,
    //                                   width: 188,
    //                                   decoration: BoxDecoration(
    //                                       boxShadow: [
    //                                         BoxShadow(
    //                                             color: Colors.grey.shade400,
    //                                             blurRadius: 2,
    //                                             // spreadRadius: 2,
    //                                             offset: const Offset(1, 0))
    //                                       ],
    //                                       color: white,
    //                                       borderRadius:
    //                                           BorderRadius.circular(8)),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                           10.0.addHSpace(),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: List.generate(
    //                                 4,
    //                                 (index) => const CircleAvatar(
    //                                       backgroundColor: Color(0xffD9D9D9),
    //                                       radius: 6,
    //                                     ).paddingOnly(right: 3)),
    //                           ),
    //                           15.0.addHSpace(),
    //                           SizedBox(
    //                             height: 210,
    //                             child: ListView.builder(
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: 4,
    //                               shrinkWrap: true,
    //                               itemBuilder: (context, index) {
    //                                 return Container(
    //                                   height: 210,
    //                                   width: 170,
    //                                   decoration: BoxDecoration(
    //                                     borderRadius:
    //                                         BorderRadius.circular(10),
    //                                   ),
    //                                   child: Image.asset(ImageAssets.tree),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                           15.0.addHSpace(),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                         onTap: () {},
    //                         child: Image.asset(ImageAssets.charityImage)),
    //                   ],
    //                 )
    //               ],
    //             )),
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // ),
  }
}