import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/tab_bar_const.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';

import '../../../../widgets/appbar_chip.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';

class WellBeingMain extends StatefulWidget {
  const WellBeingMain({super.key});

  @override
  State<WellBeingMain> createState() => _WellBeingMainState();
}

TabController? controller;

class _WellBeingMainState extends State<WellBeingMain>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: BottomNaviBarScreen(
          bottomColor: darkDeepPurple,
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
              controller: controller,
              // physics: const NeverScrollableScrollPhysics(),
              indicatorWeight: 0,
              onTap: (index) {
                if (index != 0 || index != 4) {
                  wellbeingTabs[controller?.index ?? 0].onTap.call();
                }
                controller?.animateTo(0);
              },
              indicator: indicatorWidth(white),
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
          child: wellbeingTabs[controller?.index ?? 0].tabWidget,
        ));
  }
}
