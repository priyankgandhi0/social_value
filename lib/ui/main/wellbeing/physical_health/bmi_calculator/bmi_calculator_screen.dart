import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/bulletlist.dart';
import '../../../../../widgets/common_textfield.dart';
import 'bmi_calculator_controller.dart';

class PhysicalHealthBmiCalculator extends StatelessWidget {
  PhysicalHealthBmiCalculator({Key? key}) : super(key: key);
  final BmiCalculatorController controller = Get.put(BmiCalculatorController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                border: Border.all(color: darkDeepPurple),
                color: Colors.white),
            child: Form(
              key: controller.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Find Out What Your BMI is'.interTextStyle(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  10.0.addHSpace(),
                  StartUpTextFiled(
                    controller: controller.weightCtrl,
                    headingText: 'Enter your weight in kg',
                    headingTextColor: Colors.black,
                    hintText: '',
                    fillColor: Colors.transparent,
                    borderColor: Colors.grey,
                    fontColor: Colors.black,
                    validator: (_) {
                      if (controller.weightCtrl.text.isEmpty) {
                        return pleaseEnterWeight;
                      }
                      return null;
                    },
                  ),
                  10.0.addHSpace(),
                  StartUpTextFiled(
                    controller: controller.heightCtrl,
                    headingText: 'Height in cm',
                    headingTextColor: Colors.black,
                    hintText: '',
                    fillColor: Colors.transparent,
                    borderColor: Colors.grey,
                    fontColor: Colors.black,
                    validator: (_) {
                      if (controller.heightCtrl.text.isEmpty) {
                        return pleaseEnterHeight;
                      }
                      return null;
                    },
                  ),
                  25.0.addHSpace(),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (controller.key.currentState!.validate()) {
                          controller.isCalculate.value =
                              !controller.isCalculate.value;
                        }
                      },
                      child: Container(
                        height: 45,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(color: darkDeepPurple),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            'Calculate BMI'.interTextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  35.0.addHSpace(),
                  Obx(
                    () => !controller.isCalculate.value
                        ? Text("51454")
                        : Text(""),
                  ),
                  'Body Mass Index (BMI) is a measuring tool used by general practitioners (GPs) and allied health professionals to see whether your weight is deemed healthy. The BMI scale divides an adult’s weight in Kilograms (KGs) by their height in meters squares (M2).'
                      .interTextStyle(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  )
                ],
              ).paddingAll(10),
            ),
          ).paddingSymmetric(horizontal: 15, vertical: 15).paddingOnly(top: 15),
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
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: 'BMI Ranges for adults'.interTextStyle(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                10.0.addHSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                      'BMI Ranges for children and Adolescents'.interTextStyle(
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
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
          ).paddingSymmetric(horizontal: 15, vertical: 10),
          30.0.addHSpace(),
        ],
      ),
    );
  }
}
