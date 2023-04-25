import 'package:flutter/material.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../generated/assets.dart';
import '../../../../../widgets/common_card.dart';

class PhysicalHealthLesMills extends StatelessWidget {
  const PhysicalHealthLesMills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 311,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 3,
                    offset: const Offset(2, 2))
              ], borderRadius: BorderRadius.circular(8), color: white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.imagesLessmills,
                      color: Colors.black,
                    ),
                    20.0.addHSpace(),
                    lessmillsDesc.interTextStyle(
                        maxLines: 12,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              ),
            ),
            20.0.addHSpace(),
            chooseYourWorkout.interTextStyle(
                fontSize: 16, fontWeight: FontWeight.w700),
            15.0.addHSpace(),
            GridView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 9 / 7
                  // mainAxisSpacing: 10,
                  ),
              itemBuilder: (BuildContext context, int index) {
                return const WorkOutCard(
                  title: 'BODYPUMP',
                  image: Assets.imagesWorkoutImg,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
