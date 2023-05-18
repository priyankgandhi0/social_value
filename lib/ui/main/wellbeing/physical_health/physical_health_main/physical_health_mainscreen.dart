import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/tab_bar_const.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/les_mills/less_mills_controller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/appbar_chip.dart';
import '../../../bottom_nav_bar/bottom_navigation_screen.dart';

class PhysicalHealthMainScreen extends StatefulWidget {
  const PhysicalHealthMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysicalHealthMainScreen> createState() =>
      _PhysicalHealthMainScreenState();
}

class _PhysicalHealthMainScreenState extends State<PhysicalHealthMainScreen>
    with SingleTickerProviderStateMixin {
  dynamic data = Get.arguments;
  TabController? controller;
  final LessMillsController lesMilsCtrl = Get.put(LessMillsController());
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 6);
    controller!.index = data["selectedPage"];
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
      length: 6,
      child: BottomNaviBarScreen(
        bottomColor: darkDeepPurple,
        color: darkDeepPurple,
        appbar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: darkDeepPurple,
          title: Row(
            children: [
              AppBarChip(
                onTap: () {
                  // Get.back();
                  Get.toNamed(Routes.wellBeingDashBoardScreen);
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
                text: myPhysicalHealth,
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
            indicatorWeight: 1,
            onTap: (index) {
              if (index != 0) {
                wellbeingPhysicalHealthTabs[controller?.index ?? 0]
                    .onTap
                    .call();
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
            tabs: wellbeingPhysicalHealthTabs
                .map(
                  (e) => Tab(text: e.tabText),
                )
                .toList(),
          ),
        ),
        child: TabBarView(
          controller: controller,
          children:
              wellbeingPhysicalHealthTabs.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
