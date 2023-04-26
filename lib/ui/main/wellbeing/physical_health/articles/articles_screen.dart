import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';

import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/common_card.dart';

class PhysicalHealthArticleScreen extends StatelessWidget {
  const PhysicalHealthArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                articleCategoryTitle.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(left: 10),
            18.0.addHSpace(),
            GridView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (BuildContext context, int index) {
                return AppBodyPumptCard(
                  onTap: () {
                    Get.toNamed(Routes.articleDetailScreen, arguments: [
                      {
                        "text": "physical health",
                      },
                      {"color": darkDeepPurple},
                      {"color1": darkDeepPurple}
                    ]);
                  },
                  title: index == 0
                      ? 'Vegan 7 Day Plan'
                      : 'Lower Bodypump Session 2',
                  image: index == 0
                      ? ImageAssets.foodImage
                      : Assets.imagesWorkoutImg,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
