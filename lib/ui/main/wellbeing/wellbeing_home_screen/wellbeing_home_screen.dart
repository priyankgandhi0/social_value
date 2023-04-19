import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:social_value/ui/main/wellbeing/wellbeing_home_screen/wellbeing_home_controller.dart';

import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';

import '../../bottom_nav_bar/bottom_navigation_screen.dart';

class WellBeingHomeScreen extends StatelessWidget {
  WellBeingHomeScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final WellbeingHomeController controller = WellbeingHomeController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: BottomNaviBarScreen(
          color: darkDeepPurple,
          appbar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: darkDeepPurple,
            title: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: wellbeing.interTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                )),
            bottom: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: const EdgeInsets.only(top: 3),
              controller: controller.controller,
              // physics: const NeverScrollableScrollPhysics(),
              indicatorWeight: 0,
              onTap: (int) {},
              indicator: indicatorWidth(),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: white,
              labelColor: white,
              unselectedLabelColor: white,
              labelStyle: GoogleFonts.inter(
                  color: white, fontWeight: FontWeight.w700, fontSize: 13),
              unselectedLabelStyle: GoogleFonts.inter(
                  color: white, fontWeight: FontWeight.w700, fontSize: 13),
              tabs: const [
                Tab(text: dashboard),
                Tab(text: myPhysicalHealth),
                Tab(text: myMentalHealth),
                Tab(text: finances)
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ));
  }
}
