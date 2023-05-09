import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/constant/tab_bar_const.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../widgets/appbar_chip.dart';
import '../../../bottom_nav_bar/bottom_navigation_screen.dart';

class FinanceMain extends StatefulWidget {
  const FinanceMain({Key? key}) : super(key: key);

  @override
  State<FinanceMain> createState() => _FinanceMainState();
}

class _FinanceMainState extends State<FinanceMain>
    with SingleTickerProviderStateMixin {
  dynamic data = Get.arguments;
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 5);
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
                text: finances,
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
                wellbeingFinanceTabs[controller?.index ?? 0].onTap.call();
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
            tabs: wellbeingFinanceTabs
                .map(
                  (e) => Tab(text: e.tabText),
                )
                .toList(),
          ),
        ),
        child: TabBarView(
          controller: controller,
          children: wellbeingFinanceTabs.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
