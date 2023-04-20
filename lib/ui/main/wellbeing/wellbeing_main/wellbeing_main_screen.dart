import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/tab_bar_const.dart';
import 'package:social_value/ui/main/wellbeing/wellbeing_dashboard/wellbeing_dashboard_controller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';

import '../../../../widgets/appbar_chip.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';

class WellBeingMain extends StatefulWidget {
  @override
  State<WellBeingMain> createState() => _WellBeingMainState();
}

TabController? controller;

class _WellBeingMainState extends State<WellBeingMain> {
  final WellbeingHomeController controller = Get.put(WellbeingHomeController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: BottomNaviBarScreen(
          color: darkDeepPurple,
          appbar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: darkDeepPurple,
            title: Row(
              children: [
                AppBarChip(
                  onTap: () {},
                  text: wellbeing,
                  textColor: textColor,
                  color: white,
                ),
              ],
            ),
            bottom: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: const EdgeInsets.only(top: 3),
              controller: controller.controller,
              // physics: const NeverScrollableScrollPhysics(),
              indicatorWeight: 0,
              onTap: (index) {
                if (index != 0) {
                  wellbeingTabs[controller.controller?.index ?? 0].onTap.call();
                }
                controller.controller?.animateTo(0);
              },
              indicator: indicatorWidth(),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: white,
              labelColor: white,
              unselectedLabelColor: white,
              labelStyle: GoogleFonts.inter(
                  color: white, fontWeight: FontWeight.w700, fontSize: 13),
              unselectedLabelStyle: GoogleFonts.inter(
                  color: white, fontWeight: FontWeight.w700, fontSize: 13),
              tabs: wellbeingTabs
                  .map(
                    (e) => Tab(text: e.tabText),
                  )
                  .toList(),
            ),
          ),
          child: wellbeingTabs[controller.controller?.index ?? 0].tabWidget,
        ));
  }
}
