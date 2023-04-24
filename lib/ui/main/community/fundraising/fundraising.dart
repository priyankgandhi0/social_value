import 'package:flutter/material.dart';

import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/common_card.dart';

import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';

class FundraisingScreen extends StatelessWidget {
  const FundraisingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    ImageAssets.fundraising,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              20.0.addHSpace(),
              Container(
                  // height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: lightPurple,
                      borderRadius: BorderRadius.circular(8)),
                  child: fundraisingDesc.interTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontColor: textColor)),
              20.0.addHSpace(),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const AlcoholFreeCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
