import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../../generated/asset.dart';
import '../../../../../widgets/common_card.dart';

class PhysicalHealthDashBoard extends StatelessWidget {
  const PhysicalHealthDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.0.addHSpace(),
            'Physical Health Home'
                .interTextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            10.0.addHSpace(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ImageAssets.ladyImage1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            10.0.addHSpace(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppSquareCard(
                    iconVisible: false,
                    desc: 'Discover What Your BMI is',
                    btnText: '',
                    image: ImageAssets.imagesWorkoutImg,
                    descColor: Colors.white,
                  ),
                  AppSquareCard(
                    desc: 'Healthy Eating Made easy with our Meal Plans',
                    btnText: 'Download Now',
                    image: ImageAssets.imagesWorkoutImg,
                    descColor: Colors.white,
                  ),
                ],
              ),
            ),
            10.0.addHSpace(),
            'Your Daily Workout Videos'
                .interTextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            10.0.addHSpace(),
            SizedBox(
              height: 111,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppVideoCommonCard(
                      image: ImageAssets.imagesWorkoutImg);
                },
              ),
            ),
            10.0.addHSpace(),
            'Latest Articles'
                .interTextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            10.0.addHSpace(),
            SizedBox(
              height: 165,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppArticlesCard(
                      descColor: Colors.black,
                      desc:
                          'Diabetes - What you need to knowabout this condition',
                      image: ImageAssets.imagesWorkoutImg);
                },
              ),
            ),
            10.0.addHSpace(),
          ],
        ).paddingSymmetric(horizontal: 15),
      ),
    ).paddingOnly(bottom: 18);
  }
}
