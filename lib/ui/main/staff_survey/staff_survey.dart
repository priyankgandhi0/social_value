import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

import '../../../constant/app_string.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/appbar_chip.dart';
import '../../../widgets/common_card.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class StaffSurveyScreen extends StatelessWidget {
  const StaffSurveyScreen({Key? key}) : super(key: key);

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
            children: [
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return QuestionsCard(
                    question: "Questionnaire Name Here",
                    date: "23rd April 2024",
                    onTap: () {
                      Get.toNamed(Routes.staffSurveyQuestion);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
