import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/articles/article_controller.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../constant/app_string.dart';
import '../../../../generated/asset.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/wellbeing_screen_card.dart';

class PlanetDashboard extends StatelessWidget {
  PlanetDashboard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: GetBuilder<ArticleController>(initState: (state) {
          controller.articlesList.clear();
          Future.delayed(Duration.zero)
              .then((value) => controller.getArticles("13"));
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
                          scoreTitle: scoreTitle,
                          scoreDesc: scoreDesc,
                          percentage: 0.75,
                          bgColor: darkGreen,
                          percentageColor: darkGreen,
                          score: '75',
                        ),
                      ),
                      const VerticalDivider(
                        color: darkGreen,
                        thickness: 1,
                      ),
                      Flexible(
                        child: PlanetScore(
                          scoreTitle: "Test Company's EDI Score",
                          scoreDesc: scoreDesc,
                          percentage: 0.75,
                          bgColor: darkGreen,
                          percentageColor: darkGreen,
                          score: '75',
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
                      top: 260,
                      height: 320,
                      width: 211,
                      desc:
                          'Access the #1 app for sleep. anxiety, stress and mental health',
                      btnText: startSurvey,
                      image: Assets.imagesLadyImage2,
                      descColor: Colors.white,
                      onTap: () {},
                    ).paddingOnly(
                      left: 10,
                    ),
                    AppRactangleCard(
                      height: 320,
                      width: 211,
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
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.articlesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AppArticlesCard(
                        onTap: () {
                          Get.toNamed(Routes.articleDetailScreen, arguments: [
                            {
                              "text": "planet",
                            },
                            {"color": darkGreen},
                            {"color1": darkGreen},
                            {"id": ctrl.articlesList[index].id}
                          ]);
                        },
                        descColor: Colors.black,
                        desc: ctrl.articlesList[index].title,
                        image: ctrl.articlesList[index].featuredImage);
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
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AppArticlesCard(
                        onTap: () {},
                        descColor: Colors.black,
                        desc:
                            'Diabetes - What you need to knowabout this condition',
                        image:
                            "https://www.app.socialvaluecompany.com/assets/img/wellnesshub.jpg");
                  },
                ),
              ).paddingOnly(left: 10, right: 10),
            ],
          );
        }),
      ),
    );
  }
}
