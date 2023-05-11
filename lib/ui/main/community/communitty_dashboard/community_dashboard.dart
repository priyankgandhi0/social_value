import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/wellbeing_screen_card.dart';

import '../../../../constant/app_string.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/app_button.dart';

class CommunityDashboard extends StatelessWidget {
  const CommunityDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: communityHome.interTextStyle(
                  fontWeight: FontWeight.w700, fontSize: 16),
            ),
            20.0.addHSpace(),
            SizedBox(
              height: 175,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 175,
                    width: 160,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            image: AssetImage(
                              ImageAssets.hand,
                            ),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            20.0.addHSpace(),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: darkPurple, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Image.asset(
                    IconsAssets.celenderIcon,
                    color: white,
                  ),
                  10.0.addWSpace(),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        nextAwarenessDay.interTextStyle(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontColor: white),
                        7.0.addHSpace(),
                        internationalMicrovolunteering.interTextStyle(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            fontColor: white),
                        7.0.addHSpace(),
                        "15th April 2023".interTextStyle(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontColor: white)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            25.0.addHSpace(),
            XoDiscountCard(
              onTap: () {},
              fillColor: lightPurple,
              image: Assets.imagesCreditCard,
              appBorderFillColor: darkPurple,
              desc: memberShipDesc,
            ).paddingSymmetric(horizontal: 20),
            20.0.addHSpace(),
            Container(
                padding: const EdgeInsets.all(10),
                height: 250,
                width: double.infinity,
                // color: Colors.white,
                child: Column(
                  children: [
                    ukBased.interTextStyle(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontColor: textColor,
                        fontSize: 16,
                        maxLines: 2),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(ImageAssets.shelterImage),
                          Image.asset(ImageAssets.teensUnitsImage),
                          80.0.addWSpace(),
                          Image.asset(ImageAssets.cfImage),
                          Image.asset(ImageAssets.trusselImage),
                        ],
                      ),
                    ),
                    15.0.addHSpace(),
                    AppButton(text: "Find out more", onTap: () {}),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
