import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../theme/app_color.dart';
import '../../../utils/BulletList.dart';
import '../../../widgets/common_textfield.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 2,
                        // spreadRadius: 2,
                        offset: const Offset(1, 0))
                  ],
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
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 2,
                    // spreadRadius: 2,
                    offset: const Offset(1, 0))
              ], borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.0.addHSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: 'BMI Ranges for adults'.interTextStyle(
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  10.0.addHSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: 'If your BMI is:'.interTextStyle(
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  10.0.addHSpace(),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: SingleChildScrollView(
                      child: BulletList(const [
                        'Below 18.5 – you’re in the underweight range.',
                        'Between 18.5 and 24.9 – you’re in the healthy weight range.',
                        'Between 25 and 29.9 – you’re in the overweight range.',
                        'Between 30 and 39.9 – you’re in the obese range.',
                      ], isBulletText: true),
                    ),
                  ),
                  15.0.addHSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: 'BMI Ranges for children and Adolescents'
                        .interTextStyle(
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  10.0.addHSpace(),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: SingleChildScrollView(
                      child: BulletList(const [
                        'Below 5% percentile range - you’re in the underweight range.',
                        'Between 5 – 85% percentile range - you’re in the healthy weight range.',
                        'Between 85 – 95% percentile range - you’re at risk of being overweight.',
                        'Over 95% percentile range – You’re overweight.',
                      ], isBulletText: true),
                    ),
                  ),
                  15.0.addHSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: 'Limitations of BMI'.interTextStyle(
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  10.0.addHSpace(),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: SingleChildScrollView(
                      child: BulletList(const [
                        'As BMI is broadly used as an indicator for estimating an individual’s healthy weight. This should not be misconstrued as an individual body composition as it is frequently suggested within certain sub-groups of health professionals.',
                        'Body composition is multifaceted and is influenced by age, sex, gender, ethnicity, muscle mass, body fat and activity levels.',
                        'For the athletic population who carry a lot of muscle mass, BMI will frequently indicate they are overweight or obese when they are healthy for the sport, activity levels, and composition.',
                        'Individuals who are endurance-based will likely be deemed underweight according to BMI but be healthy when analysing their body composition.',
                        'Older adults tend to have higher percentages of body fat compared to younger adults who have the same BMI, with females having higher body fat than same-age males with an equivalent BMI.',
                      ]),
                    ),
                  ),
                  15.0.addHSpace(),
                ],
              ),
            ).paddingSymmetric(horizontal: 10)
          ],
        ),
      ),
    );
  }
}
