import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/ui/main/wellbeing/physical_Health_Home/physical_health_homeController.dart';

import 'package:social_value/utils/extension.dart';

import '../../../../constant/app_string.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';

class PhysicalHealthHomeScreen extends StatelessWidget {
  PhysicalHealthHomeScreen({Key? key}) : super(key: key);
  final PhysicalHealthHomeController controller =
      Get.put(PhysicalHealthHomeController());

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
              Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: deepPurple,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: wellbeing.interTextStyle(
                        fontColor: white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )),
              const Icon(
                Icons.arrow_forward_ios,
                color: white,
                size: 20,
              ),
              Container(
                  height: 30,
                  width: 172,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: myPhysicalHealth.interTextStyle(
                        // fontColor: white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            controller: controller.controller,
            // physics: const NeverScrollableScrollPhysics(),
            indicatorWeight: 1,
            onTap: (int) {},
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
            tabs: const [
              Tab(text: dashboard),
              Tab(text: lesMills),
              Tab(text: bmiCalculator),
              Tab(text: mealPlans),
              Tab(text: articles),
              Tab(text: dailyWorkouts),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
