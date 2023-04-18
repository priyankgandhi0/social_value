import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';

import '../utils/extension.dart';

class SuppliesOnGoTabs extends StatelessWidget {
  final String tabOne;
  final String tabTwo;
  final String tabThree;
  final String tabFour;
  final TabController controller;
  final bottomPadding = 5;
  final Function(int)? onTabTap;

  const SuppliesOnGoTabs(
      {Key? key,
      required this.tabOne,
      this.onTabTap,
      required this.tabTwo,
      required this.controller,
      required this.tabThree,
      required this.tabFour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // width: Get.size.width * 0.52,
          height: 30,
          padding: const EdgeInsets.only(bottom: 5),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              indicatorWeight: 2,
              onTap: onTabTap,
              indicator: indicatorWidth(),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: white,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 10),
              unselectedLabelStyle: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 10),
              tabs: [
                Tab(
                  child: Text(tabOne),
                ),
                Tab(child: Text(tabTwo)),
                Tab(child: Text(tabThree)),
                Tab(child: Text(tabFour)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
