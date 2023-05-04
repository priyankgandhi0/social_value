import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';
import '../../physical_health/articles/article_controller.dart';

class MentalHealthDashBoard extends StatelessWidget {
  MentalHealthDashBoard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ArticleController>(initState: (state) {
        controller.articlesList.clear();
        Future.delayed(Duration.zero)
            .then((value) => controller.getArticles("30"));
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
            SizedBox(
              height: 111,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppVideoCommonCard(
                    image: Assets.imagesWorkoutImg,
                  );
                },
              ),
            ).paddingOnly(left: 10, right: 20),
            30.0.addHSpace(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppSquareCard(
                    iconVisible: false,
                    desc: '',
                    btnText: null,
                    image: ImageAssets.friendImage,
                    descColor: Colors.white,
                  ),
                  AppSquareCard(
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
                itemCount: ctrl.articlesList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppArticlesCard(
                      onTap: () {},
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
