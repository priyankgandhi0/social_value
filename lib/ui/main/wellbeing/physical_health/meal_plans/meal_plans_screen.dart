import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/app_string.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/common_card.dart';

class PhysicalHealthMealPlans extends StatelessWidget {
  const PhysicalHealthMealPlans({Key? key}) : super(key: key);

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
                mealPlans.interTextStyle(
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
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return AppBodyPumptCard(
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
