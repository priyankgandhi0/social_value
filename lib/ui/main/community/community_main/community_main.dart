import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';
import '../../../../constant/app_string.dart';
import '../../../../constant/tab_bar_const.dart';
import '../../../../utils/extension.dart';
import '../../../../widgets/appbar_chip.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';
import '../../wellbeing/physical_health/articles/article_controller.dart';
import '../fundraising/fundraising_controller.dart';
import '../volunteering_screen/volunteering_controller.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain>
    with SingleTickerProviderStateMixin {
  final ArticleController articleController = Get.put(ArticleController());
  final FundraisingController fundraisingController = Get.put(FundraisingController());
  final VolunteeringController volunteeringController = Get.put(VolunteeringController());
  TabController? controller;
  dynamic data = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 6);
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
      length: 6,
      child: BottomNaviBarScreen(
        bottomColor: darkPurple,
        backGround: white,
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
            controller: controller,
            indicatorWeight: 1,
            onTap: (index) {
              if (index != 0) {
                communityTabs[controller?.index ?? 0].onTap.call();
              }
            },
            indicator: indicatorWidth(Colors.white),
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
          controller: controller,
          children: communityTabs.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
