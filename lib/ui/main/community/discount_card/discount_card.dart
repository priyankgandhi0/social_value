import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../constant/app_string.dart';
import '../../../../generated/asset.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/app_button.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffF4F4F4)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3,
                        offset: const Offset(3, 3))
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Image.asset(
                    ImageAssets.discountCard,
                  ),
                  20.0.addHSpace(),
                  AppBorderButton(
                    text: startSavingNow,
                    borderColor: darkPurple,
                    onTap: () {},
                  ).paddingOnly(left: 60, right: 60)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
