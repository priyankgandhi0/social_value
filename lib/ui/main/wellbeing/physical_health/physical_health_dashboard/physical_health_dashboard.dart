import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../constant/requst_const.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../../../dashboard_screen/dashboard_contorller.dart';
import '../articles/article_controller.dart';

class PhysicalHealthDashBoard extends StatelessWidget {
  PhysicalHealthDashBoard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());

  final DashboardController dashboardController =
      Get.put(DashboardController());

  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: GetBuilder<ArticleController>(initState: (state) {
            dashboardController.getVideo.clear();
            controller.articlesList.clear();
            Future.delayed(Duration.zero).then((value) =>
                controller.getArticles(MethodIDs.physicalDashboardArticle));
            Future.delayed(Duration.zero).then((value) => dashboardController
                .getVideos(MethodIDs.physicalDashboardVideo));
          }, builder: (ctrl) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.0.addHSpace(),
                'Physical Health Home'.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
                20.0.addHSpace(),
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(Routes.physicalHealthMainScreen,
                        arguments: {"selectedPage": 1});
                  },
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
                ),
                30.0.addHSpace(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AppSquareCard(
                        onTap: () {
                          Get.offAndToNamed(Routes.physicalHealthMainScreen,
                              arguments: {"selectedPage": 2});
                        },
                        desc: 'Discover What Your BMI is',
                        btnText: 'Get Your BMI',
                        image: ImageAssets.bmiImage,
                        descColor: Colors.white,
                      ),
                      AppSquareCard(
                        onTap: () {
                          Get.offAndToNamed(Routes.physicalHealthMainScreen,
                              arguments: {"selectedPage": 3});
                        },
                        desc: 'Healthy Eating Made easy with our Meal Plans',
                        btnText: 'Download Now',
                        image: ImageAssets.foodImage1,
                        descColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                30.0.addHSpace(),
                yourDailyWorkoutVideos.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
                10.0.addHSpace(),
                Obx(
                  () => controller.isLoading.value
                      ? SizedBox(
                          height: 123,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 4,
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
                            shrinkWrap: true,
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
                                            color: Colors.grey.shade400,
                                            blurRadius: 3,
                                            offset: const Offset(3, 3))
                                      ],
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          Image.file(
                                            File(dashboardController
                                                .getVideo[index].thumbnail ?? ""),
                                            errorBuilder:
                                                (context, error, trace) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            },
                                            height: 111,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                          Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.videoPlayerScreen,
                                                    arguments: {
                                                      "url": dashboardController
                                                          .getVideo[index]
                                                          .videoUrl
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
                        ),
                ),
                30.0.addHSpace(),
                latestArticlesText.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
                10.0.addHSpace(),
                ctrl.articlesList.isEmpty
                    ? const SizedBox(
                        height: 123,
                      )
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
                                          "text": "physical health",
                                        },
                                        {"color": darkDeepPurple},
                                        {"color1": darkDeepPurple},
                                        {"id": ctrl.articlesList[index].id}
                                      ]);
                                },
                                descColor: Colors.black,
                                desc: ctrl.articlesList[index].title,
                                image: ctrl.articlesList[index].featuredImage);
                          },
                        ),
                      ),
                10.0.addHSpace(),
              ],
            ).paddingSymmetric(horizontal: 15);
          }),
        ).paddingOnly(bottom: 18),
        Obx(() => controller.isLoading.value
            ? const AppProgress(
                color: darkDeepPurple,
              )
            : Container()),
      ],
    );
  }
}
