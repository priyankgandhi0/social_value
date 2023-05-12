import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/app_progress.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/wellbeing_screen_card.dart';
import '../../dashboard_screen/dashboard_contorller.dart';
import '../physical_health/articles/article_controller.dart';

class WellBeingDashBoardScreen extends StatelessWidget {
  WellBeingDashBoardScreen({Key? key}) : super(key: key);
  final DashboardController controller = Get.put(DashboardController());
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<DashboardController>(initState: (state) {
        Future.delayed(Duration.zero)
            .then((value) => controller.getVideos("65"));
        controller.getVideo.clear();
        Future.delayed(Duration.zero).then((value) => articleController.getArticles(
            "5,9,10,14,15,17,22,23,24,26,29,31,32,33,34,35,36,37,38,39,40,41,442,49"));
        articleController.articlesList.clear();
      }, builder: (ctrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WellBeingScore(
              scoreTitle: scoreTitle,
              scoreDesc: scoreDesc,
              percentage: 0.7,
              bgColor: deepPurple,
              percentageColor: darkDeepPurple,
              score: '75',
            ),
            10.0.addHSpace(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppRactangleCard(
                    // top: 260,
                    height: 320,
                    width: 211,
                    // btnText: accessNow,
                    image: ImageAssets.recLessMillsImage,
                    onTap: () {
                      Get.toNamed(Routes.physicalHealthMainScreen,
                          arguments: {"selectedPage": 1});
                    },
                  ).paddingOnly(
                    left: 10,
                  ),
                  AppRactangleCard(
                    // top: 260,
                    height: 320,
                    width: 211,
                    // btnText: accessNow,
                    image: ImageAssets.appforSleepImage,
                    onTap: () {
                      Get.toNamed(Routes.mentalHealthMain,
                          arguments: {"selectedPage": 1});
                    },
                  ).paddingOnly(right: 10),
                ],
              ),
            ),
            30.0.addHSpace(),
            Row(
              children: [
                trySomeYoga.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(left: 20),
            10.0.addHSpace(),
            Obx(
              () => controller.isLoading.value
                  ? SizedBox(
                      height: 113,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 7,
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
                        cacheExtent: 1000,
                        shrinkWrap: true,
                        // key: const PageStorageKey(),
                        addAutomaticKeepAlives: false,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(
                                  right: 10, left: 10, bottom: 10),
                              height: 111,
                              width: 188,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade600,
                                        blurRadius: 2,
                                        offset: const Offset(3, 3))
                                  ],
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    children: [
                                      Image.file(
                                        File(ctrl.getVideo[index].thumbnail ??
                                            ""),
                                        errorBuilder: (context, error, trace) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        },
                                        height: 111,
                                        width: 188,
                                        fit: BoxFit.cover,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.videoPlayerScreen,
                                                arguments: {
                                                  "url": ctrl
                                                      .getVideo[index].videoUrl
                                                });
                                          },
                                          child: Image.asset(
                                            color: Colors.grey.shade300
                                                .withOpacity(0.9),
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
                    ).paddingOnly(left: 10, right: 10),
            ),
            // SizedBox(
            //   height: 111,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 4,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       return const AppVideoCommonCard(
            //         image: Assets.imagesWorkoutImg,
            //       );
            //     },
            //   ),
            // ).paddingOnly(left: 10, right: 10),
            30.0.addHSpace(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppSquareCard(
                    onTap: () {
                      Get.toNamed(Routes.mentalHealthMain,
                          arguments: {"selectedPage": 6});
                    },
                    iconVisible: false,
                    desc: '',
                    btnText: null,
                    image: ImageAssets.support,
                    descColor: Colors.white,
                  ),
                  AppSquareCard(
                    onTap: () {
                      Get.toNamed(Routes.physicalHealthMainScreen,
                          arguments: {"selectedPage": 3});
                    },
                    desc: 'Healthy Eating Made easy with our Meal Plans',
                    btnText: 'Download Now',
                    image: ImageAssets.foodImage1,
                    descColor: Colors.white,
                  ),
                ],
              ),
            ).paddingOnly(left: 10, right: 10),
            30.0.addHSpace(),
            Row(
              children: [
                latestArticlesText.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(
              left: 20,
            ),
            10.0.addHSpace(),
            Obx(
              () => ctrl.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: darkDeepPurple,
                      ),
                    )
                  : articleController.articlesList.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 165,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AppArticlesCard(
                                  onTap: () {
                                    Get.toNamed(Routes.articleDetailScreen,
                                        arguments: [
                                          {
                                            "text": "Wellbeing",
                                          },
                                          {"color": darkDeepPurple},
                                          {"color1": darkDeepPurple},
                                          {
                                            "id": articleController
                                                .articlesList[index].id
                                          }
                                        ]);
                                  },
                                  descColor: Colors.black,
                                  desc: articleController
                                      .articlesList[index].title,
                                  image: articleController
                                      .articlesList[index].featuredImage);
                            },
                          ),
                        ).paddingOnly(left: 10, right: 10),
            ),
            30.0.addHSpace(),
          ],
        );
      }),
    );
  }
}
