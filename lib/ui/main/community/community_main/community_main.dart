import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';

import '../../../../constant/app_string.dart';
import '../../../../constant/tab_bar_const.dart';
import '../../../../utils/extension.dart';
import '../../../../widgets/appbar_chip.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';
import 'main_controller.dart';

class CommunityMain extends StatelessWidget {
  CommunityMain({Key? key}) : super(key: key);
  final CommunityMainController controller = Get.put(CommunityMainController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BottomNaviBarScreen(
        color: darkPurple,
        appbar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: darkPurple,
          title: Row(
            children: [
              AppBarChip(
                onTap: () {},
                text: community,
                textColor: white,
                color: purple,
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
                communityTabs[controller.controller?.index ?? 0].onTap.call();
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
            tabs: communityTabs
                .map(
                  (e) => Tab(text: e.tabText),
                )
                .toList(),
          ),
        ),
        child: TabBarView(
          controller: controller.controller,
          children: communityTabs.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
