import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/tab_bar_const.dart';
import 'package:social_value/theme/app_color.dart';

import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';

import '../../../../../widgets/appbar_chip.dart';
import '../../../bottom_nav_bar/bottom_navigation_screen.dart';

class MentalHealthMain extends StatefulWidget {
  const MentalHealthMain({
    Key? key,
  }) : super(key: key);
  // final int? selectedPage;

  @override
  State<MentalHealthMain> createState() => _MentalHealthMainState();
}

class _MentalHealthMainState extends State<MentalHealthMain>
    with SingleTickerProviderStateMixin {
  dynamic data = Get.arguments;
  TabController? controller;
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 7);
    controller!.index = data["selectedPage"];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: data["selectedPage"],
      length: 7,
      child: BottomNaviBarScreen(
        bottomColor: darkDeepPurple,
        backGround: white,
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
            controller: controller,
            // physics: const NeverScrollableScrollPhysics(),
            indicatorWeight: 1,
            onTap: (index) {
              if (index != 0) {
                wellbeingMentalHealthTabs[controller?.index ?? 0].onTap.call();
              }
            },
            indicator: indicatorWidth(white),
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
          ),
        ),
        child: TabBarView(
          controller: controller,
          children: wellbeingMentalHealthTabs.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
