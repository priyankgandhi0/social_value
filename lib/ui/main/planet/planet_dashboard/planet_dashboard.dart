import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/articles/article_controller.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/app_progress.dart';
import '../../../../constant/app_string.dart';
import '../../../../generated/asset.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/wellbeing_screen_card.dart';
import '../../wellbeing/wellbeing_dashboard/wellbeing_dashboard_controller.dart';

class PlanetDashboard extends StatelessWidget {
  PlanetDashboard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  final WellbeingController wellbeingController =
      Get.put(WellbeingController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: GetBuilder<ArticleController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getArticles("13"));
              controller.articlesList.clear();
              Future.delayed(Duration.zero)
                  .then((value) => controller.getArticles("11"));
              controller.planetArticleList.clear();
              Future.delayed(Duration.zero)
                  .then((value) => wellbeingController.getCompany());
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    color: lightGreen,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: PlanetScore(
                              scoreTitle: sustainabilityScore,
                              scoreDesc: sustainabilityScoreDesc,
                              percentage: double.parse(wellbeingController
                                          .companyData?.sustainabilityScore ??
                                      "0") /
                                  100,
                              bgColor: darkGreen,
                              percentageColor: darkGreen,
                              score: wellbeingController
                                      .companyData?.sustainabilityScore ??
                                  "",
                            ),
                          ),
                          const VerticalDivider(
                            color: darkGreen,
                            thickness: 1,
                          ),
                          Flexible(
                            child: PlanetScore(
                              scoreTitle: eDIScore,
                              scoreDesc: eDIScoreDesc,
                              percentage: double.parse(wellbeingController
                                          .companyData?.diversityScore ??
                                      "0") /
                                  100,
                              bgColor: darkGreen,
                              percentageColor: darkGreen,
                              score: wellbeingController
                                      .companyData?.diversityScore ??
                                  "",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.0.addHSpace(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        AppRactangleCard(
                          height: 320,
                          width: 230,
                          desc: '',
                          btnText: null,
                          image: ImageAssets.planetImage,
                          descColor: Colors.white,
                          onTap: () {
                            Get.offAndToNamed(Routes.planetMain,
                                arguments: {"selectedPage": 1});
                          },
                        ).paddingOnly(
                          left: 10,
                        ),
                        AppRactangleCard(
                          height: 320,
                          width: 230,
                          desc: '',
                          btnText: null,
                          image: ImageAssets.journey,
                          descColor: Colors.white,
                          onTap: () {},
                        ).paddingOnly(
                          right: 10,
                        ),
                      ],
                    ),
                  ),
                  20.0.addHSpace(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffF4F4F4)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 3,
                              offset: const Offset(3, 3))
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Flexible(
                            child: helpedPlantTrees.interTextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                        20.0.addWSpace(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          // height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsTree,
                                color: Colors.white,
                              ),
                              7.0.addHSpace(),
                              "124".appEpilogueTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  fontColor: Colors.white),
                              7.0.addHSpace(),
                              treesPlantedAllTime.interTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontColor: white),
                              7.0.addHSpace(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  30.0.addHSpace(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: latestEquality.interTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontColor: textColor),
                  ),
                  10.0.addHSpace(),
                  ctrl.articlesList.isEmpty
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
                                            "text": "EDI",
                                          },
                                          {"color": darkGreen},
                                          {"color1": darkGreen},
                                          {"id": ctrl.articlesList[index].id}
                                        ]);
                                  },
                                  descColor: Colors.black,
                                  desc: ctrl.articlesList[index].title,
                                  image:
                                      ctrl.articlesList[index].featuredImage);
                            },
                          ),
                        ).paddingOnly(left: 10, right: 10),
                  40.0.addHSpace(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: latestArticlesText.interTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontColor: textColor),
                  ),
                  10.0.addHSpace(),
                  ctrl.planetArticleList.isEmpty
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
                                            "text": "Sustainability",
                                          },
                                          {"color": darkGreen},
                                          {"color1": darkGreen},
                                          {
                                            "id":
                                                ctrl.planetArticleList[index].id
                                          }
                                        ]);
                                  },
                                  descColor: Colors.black,
                                  desc: ctrl.planetArticleList[index].title,
                                  image: ctrl
                                      .planetArticleList[index].featuredImage);
                            },
                          ),
                        ).paddingOnly(left: 10, right: 10),
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value
            ? const AppProgress(
                color: darkGreen,
              )
            : Container())
      ],
    );
  }
}
