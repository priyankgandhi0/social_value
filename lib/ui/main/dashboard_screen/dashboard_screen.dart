
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/home_card_const.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';
import '../../../constant/requst_const.dart';
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
import '../wellbeing/my_mental_health/support_services/support_services_controller.dart';
import '../wellbeing/physical_health/les_mills/less_mills_controller.dart';
import 'dashboard_contorller.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String name = preferences.getString(SharedPreference.FIRST_NAME) ?? "";
  final DashboardController controller = Get.put(DashboardController());
  final LessMillsController lessMillsController =
      Get.put(LessMillsController());
  final SupportServicesController servicesController =
      Get.put(SupportServicesController());

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      color: darkGreen,
      child: SingleChildScrollView(
        child: GetBuilder<DashboardController>(initState: (state) {
          controller.getVideo.clear();
          Future.delayed(Duration.zero)
              .then((value) => controller.getVideos(MethodIDs.SupportVideosId));
        }, builder: (ctrl) {
          return Column(
            children: [
              Container(
                // height: Get.height / 2,
                width: double.infinity,
                color: darkGreen,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
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
                                      child: (preferences.getString(SharedPreference.USER_PROFILE_IMAGE) ?? "")
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
                                              child: socialValueScoreText.interTextStyle(textAlign: TextAlign.center, fontWeight: FontWeight.w400, fontSize: 16))
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
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 11, right: 11, top: 6, bottom: 6),
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
                            return ExploreHubCard(onTap: homeCard[index].onTap, color: homeCard[index].color, image: homeCard[index].image, hubDesc: homeCard[index].desc, hubName: homeCard[index].title);
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
                        onTap: () {
                          Get.toNamed(Routes.physicalHealthMainScreen,
                              arguments: {"selectedPage": 1});
                        },
                        child: const LesMillsCard(
                          insidePadding: 12,
                          cardHeight: 313,
                          textButtonBetWeen: 15,
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
                      MemberShipCard(
                        onTap: () {
                          Get.toNamed(Routes.financeMain,
                              arguments: {"selectedPage": 2});
                        },
                        text: memberShipDesc,
                      ).paddingOnly(left: 16, right: 16),

                      12.0.addHSpace(),
                      Row(
                        children: [
                          Expanded(child: maximumMemberShipText.interTextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontColor: textColor).paddingOnly(left: 16, right: 16)),
                        ],
                      ),
                      10.0.addHSpace(),

                      Obx(
                        () => controller.isLoading.value
                            ? SizedBox(
                                height: 123,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return const ShimmerEffect();
                                  },
                                ),
                              ).paddingOnly(left: 10, right: 10)
                            : SizedBox(
                                height: 123,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ctrl.getVideo.length,
                                  // cacheExtent: 1000,
                                  shrinkWrap: true,
                                  // key: const PageStorageKey(),
                                  addAutomaticKeepAlives: false,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                                        height: 111,
                                        width: 178,
                                        decoration: BoxDecoration(
                                            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3, offset: const Offset(3, 3))],
                                            color: white,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Stack(
                                              children: [

                                                // Image.file(
                                                //   File(ctrl.getVideo[index].thumbnail ?? ""),
                                                //   errorBuilder:
                                                //       (context, error, trace) {
                                                //     return const Center(
                                                //         child: CircularProgressIndicator());
                                                //   },
                                                //   height: 111,
                                                //   width: double.infinity,
                                                //   fit: BoxFit.contain,
                                                // ),
                                                ///
                                                VideoThumbnailCard(image: ctrl.getVideo[index].thumbnail.toString(),height: 115,),

                                                // Image.network(
                                                //   ctrl.getVideo[index].thumbnail ??
                                                //       "",
                                                //   errorBuilder:
                                                //       (context, error, trace) {
                                                //     return const Center(
                                                //         child:
                                                //         CircularProgressIndicator());
                                                //   },
                                                //   height: 111,
                                                //   width: double.infinity,
                                                //   fit: BoxFit.contain,
                                                // ),

                                                Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes
                                                              .videoPlayerScreen,
                                                          arguments: {
                                                            "url": ctrl
                                                                .getVideo[index]
                                                                .videoUrl
                                                          });
                                                    },
                                                    child: Image.asset(
                                                      color: darkGreen.withOpacity(0.8),
                                                      Assets.imagesPlayButton,
                                                      fit: BoxFit.cover,
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ).paddingOnly(left: 5, right: 5),
                      ),
                      // 10.0.addHSpace(),
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 246,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/img_start_survey.png',
                                      ),
                                      fit: BoxFit.cover)),
                              child: Column(

                                children: [
                                  40.0.addHSpace(),

                                  Text('''Find Out What Your Carbon Footprint Score Is''',style: GoogleFonts.epilogue(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                                  10.0.addHSpace(),
                                  '''Take a quick survey to see how you can improve'''.interTextStyle(fontSize: 12,fontColor: Colors.white,textAlign: TextAlign.center),
                                  const Spacer(),
                                  AppButton(
                                    onTap: () {
                                      Get.toNamed(Routes.planetMain, arguments: {"selectedPage": 1});
                                    },
                                    text: "Start Survey",
                                    color: white,
                                  ).paddingOnly(bottom: 10,left: 5,right: 5),
                                ],
                              ).paddingSymmetric(horizontal: 12),
                            ).paddingOnly(right: 5),
                          ),



                          10.0.addWSpace(),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                AppSquareCard(
                                  width: 200,
                                  height: 246,
                                  onTap: () {
                                    Get.toNamed(Routes.mentalHealthMain, arguments: {"selectedPage": 6});
                                  },
                                  iconVisible: false,
                                  desc: '',
                                  btnText: null,
                                  image: ImageAssets.friendImage,
                                  descColor: Colors.white,
                                ).paddingOnly(right: 10),
                                SvgPicture.asset('assets/icons/atozIcon.svg',height: 40,width: 40,).paddingOnly(top: 90),
                                SvgPicture.asset('assets/icons/supportServiceIcon.svg',height: 40,width: 40,).paddingOnly(top: 115),
                                SvgPicture.asset('assets/icons/inUkIcon.svg',height: 40,width: 40,).paddingOnly(top: 140),
                              ],
                            ),
                          ),

                        ],
                      ).paddingOnly(left: 16),

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(ImageAssets.shelterImage),
                                    Image.asset(ImageAssets.teensUnitsImage),
                                    80.0.addWSpace(),
                                    Image.asset(ImageAssets.cfImage),
                                    Image.asset(ImageAssets.trusselImage),
                                  ],
                                ),
                              ),
                              15.0.addHSpace(),
                              AppButton(
                                  text: "Find out more",
                                  onTap: () {
                                    Get.toNamed(Routes.communityMain,
                                        arguments: {"selectedPage": 5});
                                  }).paddingSymmetric(horizontal: 110),
                            ],
                          )).paddingOnly(bottom: 20),
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
    );
  }
}

