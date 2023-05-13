import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';

import '../../../../constant/app_string.dart';
import '../../../../constant/tab_bar_const.dart';
import '../../../../utils/extension.dart';
import '../../../../widgets/appbar_chip.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';

class PlanetMain extends StatefulWidget {
  const PlanetMain({
    Key? key,
  }) : super(key: key);

  @override
  State<PlanetMain> createState() => _PlanetMainState();
}

class _PlanetMainState extends State<PlanetMain>
    with SingleTickerProviderStateMixin {
  dynamic data = Get.arguments;
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
    controller!.index = data["selectedPage"]!;
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: data["selectedPage"],
      length: 4,
      child: BottomNaviBarScreen(
        color: darkGreen,
        appbar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: darkGreen,
          title: Row(
            children: [
              AppBarChip(
                onTap: () {},
                text: planet,
                textColor: white,
                color: green,
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
                communityTabs[controller?.index ?? 0].onTap.call();
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
            tabs: planetTabs
                .map(
                  (e) => Tab(text: e.tabText),
                )
                .toList(),
          ),
        ),
        child: TabBarView(
          controller: controller,
          children: planetTabs.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
