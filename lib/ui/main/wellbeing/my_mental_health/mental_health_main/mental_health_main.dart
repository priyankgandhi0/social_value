import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/tab_bar_const.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/physical_health_dashboard/dashboard_controller.dart';

import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';

import '../../../../../widgets/appbar_chip.dart';
import '../../../bottom_nav_bar/bottom_navigation_screen.dart';
import 'main_controller.dart';

class MentalHealthMain extends StatelessWidget {
  MentalHealthMain({Key? key}) : super(key: key);
  final MentalHealthMainController controller =
      Get.put(MentalHealthMainController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: BottomNaviBarScreen(
        color: darkDeepPurple,
        appbar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: darkDeepPurple,
          title: Row(
            children: [
              AppBarChip(
                onTap: () {
                  Get.back();
                },
                text: wellbeing,
                textColor: white,
                color: deepPurple,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: white,
                size: 20,
              ),
              AppBarChip(
                onTap: () {},
                text: myMentalHealth,
                textColor: textColor,
                color: white,
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            controller: controller.controller,
            // physics: const NeverScrollableScrollPhysics(),
            indicatorWeight: 1,
            onTap: (index) {
              if (index != 0) {
                wellbeingMentalHealthTabs[controller.controller?.index ?? 0]
                    .onTap
                    .call();
              }
            },
            indicator: indicatorWidth(),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            labelColor: white,
            unselectedLabelColor: white,
            labelStyle: GoogleFonts.inter(
                color: white, fontWeight: FontWeight.w700, fontSize: 13),
            unselectedLabelStyle: GoogleFonts.inter(
                color: white, fontWeight: FontWeight.w700, fontSize: 13),
            tabs: wellbeingMentalHealthTabs
                .map(
                  (e) => Tab(text: e.tabText),
                )
                .toList(),
            // const [
            //   Tab(text: dashboard),
            //   Tab(text: lesMills),
            //   Tab(text: bmiCalculator),
            //   Tab(text: mealPlans),
            //   Tab(text: articles),
            //   Tab(text: dailyWorkouts),
            // ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
