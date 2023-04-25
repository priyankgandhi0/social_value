import 'package:flutter/material.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/common_textfield.dart';

class CarbonFootPrintCalculator extends StatelessWidget {
  const CarbonFootPrintCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            householdCarbonFootprintCalculator.interTextStyle(
                fontWeight: FontWeight.w700, fontSize: 16),
            28.0.addHSpace(),
            Image.asset(
              ImageAssets.round,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
            13.0.addHSpace(),
            generalInformation.interTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                fontColor: const Color(0xff444444)),
            30.0.addHSpace(),
            generalInformationDesc.interTextStyle(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontSize: 16),
            30.0.addHSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          StartUpTextFiled(
                            fontColor: Colors.grey,
                            headingText: "Name",
                            headingTextColor: textColor,
                            isCursorShow: true,
                            borderColor: Colors.grey.shade300,
                            fillColor: backGroundColor,
                          ),
                          4.0.addHSpace(),
                          Row(
                            children: [
                              firstName.interTextStyle(
                                  fontColor: const Color(0xff555555),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)
                            ],
                          )
                        ],
                      ),
                    ),
                    20.0.addWSpace(),
                    Flexible(
                      child: Column(
                        children: [
                          StartUpTextFiled(
                            fontColor: Colors.grey,
                            headingText: "dsew",
                            headingTextColor: backGroundColor,
                            isCursorShow: true,
                            borderColor: Colors.grey.shade300,
                            fillColor: backGroundColor,
                          ),
                          4.0.addHSpace(),
                          Row(
                            children: [
                              lastName.interTextStyle(
                                  fontColor: backGroundColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                20.0.addHSpace(),
                Row(
                  children: [
                    Flexible(
                      child: StartUpTextFiled(
                        fontColor: Colors.grey,
                        headingText: "Email",
                        headingTextColor: textColor,
                        isCursorShow: true,
                        borderColor: Colors.grey.shade300,
                        fillColor: backGroundColor,
                      ),
                    ),
                    20.0.addWSpace(),
                    const Flexible(child: SizedBox()),
                  ],
                ),
              ],
            ),
            60.0.addHSpace(),
            AppFilledButton(
              width: 110,
              buttonColor: darkGreen,
              text: next,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
