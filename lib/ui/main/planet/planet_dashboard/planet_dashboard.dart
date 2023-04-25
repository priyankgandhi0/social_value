import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../constant/app_string.dart';
import '../../../../generated/asset.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/wellbeing_screen_card.dart';

class PlanetDashboard extends StatelessWidget {
  const PlanetDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: lightGreen,
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
                    // width: 6,
                    color: darkGreen,
                    thickness: 2,
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
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
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
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const AppArticlesCard(
                      descColor: Colors.black,
                      desc:
                          'Diabetes - What you need to knowabout this condition',
                      image: Assets.imagesWorkoutImg);
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
                  return const AppArticlesCard(
                      descColor: Colors.black,
                      desc:
                          'Diabetes - What you need to knowabout this condition',
                      image: Assets.imagesWorkoutImg);
                },
              ),
            ).paddingOnly(left: 10, right: 10),
          ],
        ),
      ),
    );
  }
}
