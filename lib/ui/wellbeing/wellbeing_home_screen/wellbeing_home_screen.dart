import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:social_value/ui/bottom_nav_bar/bottom_navigation_screen.dart';
import 'package:social_value/ui/wellbeing/wellbeing_home_screen/wellbeing_home_controller.dart';
import 'package:social_value/utils/extension.dart';

import '../../../constant/app_string.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/tab_bar.dart';

class WellBeingHomeScreen extends StatelessWidget {
  WellBeingHomeScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNaviBarScreen(),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: darkDeepPurple,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: wellbeing.interTextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        )),
                  ],
                ),
                Obx(() => Stack(children: [
                      ListView(controller: scrollController, children: [
                        170.0.addHSpace(),
                        SuppliesOnGoTabs(
                          tabOne: dashboard,
                          tabTwo: myPhysicalHealth,
                          tabThree: myMentalHealth,
                          tabFour: finances,
                          onTabTap: (index) {
                            controller.currentIndex.value = index;
                          },
                          controller: controller.controller,
                        ),
                        SizedBox(
                          height: 500,
                          child: TabBarView(
                            controller: controller.controller,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [],
                          ),
                        ),
                      ])
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
