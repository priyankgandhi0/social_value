import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/app_button.dart';

import '../../../constant/app_string.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/appbar_chip.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class StaffSurveyQuestion extends StatelessWidget {
  const StaffSurveyQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: staffSurvey,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  "Question ".interTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  "1 of 25".interTextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ],
              ),
              20.0.addHSpace(),
              titleQuestion.interTextStyle(
                  fontWeight: FontWeight.w700, fontSize: 17),
              20.0.addHSpace(),
              // AppBorderButton(text: next, borderColor: darkSky)
              //     .paddingOnly(right: 230)
            ],
          ),
        ),
      ),
    );
  }
}
