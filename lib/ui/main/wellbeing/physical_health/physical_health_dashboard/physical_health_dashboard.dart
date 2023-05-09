import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../articles/article_controller.dart';

class PhysicalHealthDashBoard extends StatelessWidget {
  PhysicalHealthDashBoard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: GetBuilder<ArticleController>(initState: (state) {
            controller.articlesList.clear();
            Future.delayed(Duration.zero)
                .then((value) => controller.getArticles("31"));
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
                    Get.toNamed(Routes.physicalHealthMainScreen,
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
                          Get.toNamed(Routes.physicalHealthMainScreen,
                              arguments: {"selectedPage": 2});
                        },
                        desc: 'Discover What Your BMI is',
                        btnText: 'Get Your BMI',
                        image: ImageAssets.bmiImage,
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
                ),
                30.0.addHSpace(),
                yourDailyWorkoutVideos.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
                10.0.addHSpace(),
                SizedBox(
                  height: 111,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const AppVideoCommonCard(
                        image: Assets.imagesWorkoutImg,
                      );
                    },
                  ),
                ),
                30.0.addHSpace(),
                latestArticlesText.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
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
