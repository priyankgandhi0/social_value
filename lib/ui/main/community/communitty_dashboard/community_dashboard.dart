import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/app_progress.dart';
import 'package:social_value/widgets/wellbeing_screen_card.dart';
import '../../../../constant/app_string.dart';
import '../../../../constant/requst_const.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/common_card.dart';
import '../../wellbeing/physical_health/articles/article_controller.dart';
import '../fundraising/fundraising_controller.dart';

class CommunityDashboard extends StatelessWidget {
  CommunityDashboard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  final FundraisingController fundraisingController =
      Get.put(FundraisingController());
  // final FundraisingController fundraisingController =
  //     Get.find<FundraisingController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: GetBuilder<ArticleController>(initState: (state) {
              controller.articlesList.clear();
              Future.delayed(Duration.zero).then((value) =>
                  controller.getArticles(MethodIDs.communityDashboardArticle));
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: communityHome.interTextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  20.0.addHSpace(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.communityMain,
                                arguments: {"selectedPage": 3});
                          },
                          child: FundRisingCard(width: 165,height: 175,fit: BoxFit.fitHeight,).paddingOnly(left: 20),
                        ),


                        GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.communityMain, arguments: {"selectedPage": 2});
                          },
                          child: CommunityVolunteerCard(
                            height: 175,
                            width: 165,
                            backGroundImg: Assets.communityVoluImg,
                          ).paddingOnly(left: 20),
                        ),
                      ],
                    ),
                  ),
                  20.0.addHSpace(),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed(Routes.communityMain,
                          arguments: {"selectedPage": 1});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: darkPurple,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            IconsAssets.celenderIcon,
                            color: white,
                          ),
                          10.0.addWSpace(),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                nextAwarenessDay.interTextStyle(
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontColor: white),
                                7.0.addHSpace(),
                                internationalMicrovolunteering.interTextStyle(
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontColor: white),
                                7.0.addHSpace(),
                                "15th April 2023".interTextStyle(
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontColor: white)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  25.0.addHSpace(),
                  XoDiscountCard(
                    onTap: () {
                      Get.offAndToNamed(Routes.communityMain,
                          arguments: {"selectedPage": 4});
                    },
                    fillColor: lightPurple,
                    image: Assets.imagesCreditCard,
                    appBorderFillColor: darkPurple,
                    desc: memberShipDesc,
                  ).paddingSymmetric(horizontal: 20),
                  20.0.addHSpace(),
                  Container(
                      padding: const EdgeInsets.all(10),
                      height: 250,
                      width: double.infinity,
                      // color: Colors.white,
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
                                Get.offAndToNamed(Routes.communityMain,
                                    arguments: {"selectedPage": 5});
                              }).paddingSymmetric(horizontal: 110),
                        ],
                      )),
                  20.0.addHSpace(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: latestArticlesText.interTextStyle(
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
                            itemCount: ctrl.articlesList.length >= 8
                                ? 8
                                : ctrl.articlesList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AppArticlesCard(
                                  onTap: () {
                                    Get.toNamed(Routes.articleDetailScreen,
                                        arguments: [
                                          {"text": "Community"},
                                          {"color": darkPurple},
                                          {"color1": darkPurple},
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
                ],
              ).paddingOnly(bottom: 35);
            }),
          ),
        ),
        Obx(() => controller.isLoading.value
            ? const AppProgress(color: darkPurple)
            : Container())
      ],
    );
  }
}
