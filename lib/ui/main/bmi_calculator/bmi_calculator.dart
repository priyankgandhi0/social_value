import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';

import '../../../theme/app_color.dart';
import '../../../widgets/common_textfield.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: darkPurple),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Find Out What Your BMI is'.interTextStyle(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  10.0.addHSpace(),
                  const StartUpTextFiled(
                    headingText: 'Enter your weight in kg',
                    headingTextColor: Colors.black,
                    hintText: 'Enter your weight',
                    borderColor: Colors.grey,
                    fontColor: Colors.black,
                  ),
                  10.0.addHSpace(),
                  const StartUpTextFiled(
                    headingText: 'Height in cm',
                    headingTextColor: Colors.black,
                    hintText: 'Enter your height',
                    borderColor: Colors.grey,
                    fontColor: Colors.black,
                  ),
                  25.0.addHSpace(),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: darkPurple),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            'Calculate BMI'.interTextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                fontColor: const Color(0xff333333)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  35.0.addHSpace(),
                  'Body Mass Index (BMI) is a measuring tool used by general practitioners (GPs) and allied health professionals to see whether your weight is deemed healthy. The BMI scale divides an adult’s weight in Kilograms (KGs) by their height in meters squares (M2).'
                      .interTextStyle(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  )
                ],
              ).paddingAll(10),
            ).paddingSymmetric(horizontal: 10).paddingOnly(top: 15),
            15.0.addHSpace(),
            Image.asset(
              ImageAssets.imagesDescBmi,
              fit: BoxFit.fill,
              height: Get.size.height,
              width: Get.size.width,
            ).paddingSymmetric(horizontal: 5),
          ],
        ),
      ),
    );
  }
}
