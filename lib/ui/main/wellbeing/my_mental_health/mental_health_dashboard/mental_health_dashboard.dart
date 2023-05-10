import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/dashboard_screen/dashboard_contorller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';
import '../../physical_health/articles/article_controller.dart';

class MentalHealthDashBoard extends StatelessWidget {
  MentalHealthDashBoard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ArticleController>(initState: (state) {
        Future.delayed(Duration.zero)
            .then((value) => dashboardController.getVideos("71"));
        dashboardController.getVideo.clear();
        Future.delayed(Duration.zero)
            .then((value) => controller.getArticles("30"));
        controller.articlesList.clear();
      }, builder: (ctrl) {
        return Column(
          children: [
            34.0.addHSpace(),
            Row(
              children: [
                mentalHealthHome.interTextStyle(
                    fontWeight: FontWeight.w700, fontSize: 16)
              ],
            ).paddingOnly(left: 20),
            23.0.addHSpace(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppRactangleCard(
                    top: 260,
                    height: 320,
                    width: 211,
                    desc:
                        'Access the #1 app for sleep. anxiety, stress and mental health',
                    btnText: accessNow,
                    image: ImageAssets.appforSleepImage,
                    descColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.mentalHealthMain,
                          arguments: {"selectedPage": 1});
                    },
                  ).paddingOnly(
                    left: 10,
                  ),
                  AppRactangleCard(
                    height: 320,
                    width: 211,
                    desc: '',
                    btnText: null,
                    image: ImageAssets.treeImage,
                    descColor: Colors.white,
                    onTap: () {},
                  ).paddingOnly(
                    right: 10,
                  ),
                ],
              ),
            ),
            40.0.addHSpace(),
            Row(
              children: [
                escapeWithMinuteMindFulNessVideos.interTextStyle(
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
                        itemCount: dashboardController.getVideo.length,
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
                                        File(dashboardController
                                            .getVideo[index].thumbnail!),
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
                                                  "url": dashboardController
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
                    image: ImageAssets.friendImage,
                    descColor: Colors.white,
                  ),
                  AppSquareCard(
                    onTap: () {
                      Get.toNamed(Routes.mentalHealthMain,
                          arguments: {"selectedPage": 3});
                    },
                    iconVisible: false,
                    desc: '',
                    btnText: null,
                    image: ImageAssets.relaxImage,
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
            SizedBox(
              height: 165,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppArticlesCard(
                      onTap: () {
                        Get.toNamed(Routes.articleDetailScreen, arguments: [
                          {
                            "text": "mental health",
                          },
                          {"color": darkDeepPurple},
                          {"color1": darkDeepPurple},
                          {"id": controller.articlesList[index].id}
                        ]);
                      },
                      descColor: Colors.black,
                      desc: ctrl.articlesList[index].title,
                      image: ctrl.articlesList[index].featuredImage);
                },
              ),
            ).paddingOnly(left: 10, right: 10),
            30.0.addHSpace(),
          ],
        );
      }),
    );
  }
}
