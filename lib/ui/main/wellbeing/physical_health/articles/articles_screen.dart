import 'package:flutter/material.dart';

import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';

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
            articleCategoryTitle.interTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontColor: textColor),
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
                  onTap: () {},
                  title: 'Lower Bodypump Session 2 ',
                  image: Assets.imagesWorkoutImg,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
