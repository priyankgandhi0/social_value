import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../theme/app_color.dart';
import '../../../widgets/common_card.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class SocialValueScore extends StatelessWidget {
  const SocialValueScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      backGround: darkGreen,
      color: darkGreen,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.0.addHSpace(),
              'Company Name'.appEpilogueTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontColor: Colors.white,
              ),
              10.0.addHSpace(),
              'Below are the scores that we have collected rom your organisation.'
                  .appEpilogueTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontColor: Colors.white,
              ),
              15.0.addHSpace(),
              ScorePageCard(
                scoreTitle: 'Overall Social Value Score',
                scoreDesc: '75 /100',
                percentage: 0.75,
                bgColor: lightOrange,
                percentageColor: darkOrange,
                score: '75',
              ),
              15.0.addHSpace(),
              ScorePageCard(
                scoreTitle: 'Staff Wellbeing Score',
                scoreDesc: '75 /100',
                percentage: 0.75,
                bgColor: lightDeepPurple,
                percentageColor: darkDeepPurple,
                score: '75',
              ),
              15.0.addHSpace(),
              ScorePageCard(
                scoreTitle: 'Sustainability Score',
                scoreDesc: '75 /100',
                percentage: 0.75,
                bgColor: lightOrange,
                percentageColor: darkGreen,
                score: '75',
              ),
              15.0.addHSpace(),
              ScorePageCard(
                scoreTitle: 'EDI Score',
                scoreDesc: '75 /100',
                percentage: 0.75,
                bgColor: lightSky,
                percentageColor: darkSky,
                score: '75',
              ),
              15.0.addHSpace(),
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
