import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/wellbeing_screen_card.dart';

class WellBeingDashBoardScreen extends StatelessWidget {
  const WellBeingDashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WellBeingScore(
            scoreTitle: scoreTitle,
            scoreDesc: scoreDesc,
            percentage: 0.7,
            bgColor: deepPurple,
            percentageColor: darkDeepPurple,
            score: '75',
          ),
          10.0.addHSpace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AppRactangleCard(
                  top: 260,
                  height: 320,
                  width: 211,
                  btnText: accessNow,
                  image: Assets.imagesLadyImage2,
                ).paddingOnly(
                  left: 10,
                ),
                AppRactangleCard(
                  top: 260,
                  height: 320,
                  width: 211,
                  btnText: accessNow,
                  image: Assets.imagesWorkoutImg,
                ).paddingOnly(right: 10),
              ],
            ),
          ),
          30.0.addHSpace(),
          Row(
            children: [
              trySomeYoga.interTextStyle(
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
                  // image: Assets.imagesWorkoutImg,
                  url: '', videoId: '',
                );
              },
            ),
          ).paddingOnly(left: 10, right: 10),
          30.0.addHSpace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AppSquareCard(
                  iconVisible: false,
                  desc: '',
                  btnText: null,
                  image: Assets.imagesWorkoutImg,
                  descColor: Colors.white,
                ),
                AppSquareCard(
                  desc: 'Healthy Eating Made easy with our Meal Plans',
                  btnText: 'Download Now',
                  image: Assets.imagesWorkoutImg,
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
          30.0.addHSpace(),
        ],
      ),
    );
  }
}
