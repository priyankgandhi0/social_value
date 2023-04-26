import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/help_support/help_support_controller.dart';
import 'package:social_value/utils/extension.dart';

import '../../../constant/app_string.dart';
import '../../../generated/assets.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/appbar_chip.dart';
import '../../../widgets/common_card.dart';
import '../../../widgets/common_textfield.dart';
import '../../../widgets/expanable_widget.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class HelpSupport extends StatelessWidget {
  HelpSupport({Key? key}) : super(key: key);
  final controller = Get.put(HelpSupportController());

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      bottomColor: darkSky,
      backGround: white,
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: helpCentre,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: GetBuilder<HelpSupportController>(builder: (ctrl) {
        return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            // spreadRadius: 2,
                            offset: Offset(1, 0))
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Contact Us'.interTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        10.0.addHSpace(),
                        Row(
                          children: [
                            const Flexible(
                              child: StartUpTextFiled(
                                headingText: 'Name',
                                headingTextColor: Colors.black,
                                hintText: '',
                                fillColor: Colors.transparent,
                                borderColor: Colors.grey,
                                fontColor: Colors.black,
                              ),
                            ),
                            20.0.addWSpace(),
                            const Flexible(
                              child: StartUpTextFiled(
                                headingText: 'name',
                                headingTextColor: white,
                                hintText: '',
                                fillColor: Colors.transparent,
                                borderColor: Colors.grey,
                                fontColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        20.0.addHSpace(),
                        const StartUpTextFiled(
                          headingText: 'Email',
                          headingTextColor: Colors.black,
                          hintText: '',
                          fillColor: Colors.transparent,
                          borderColor: Colors.grey,
                          fontColor: Colors.black,
                        ),
                        30.0.addHSpace(),
                        'Replace Profile Image'.interTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        10.0.addHSpace(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Center(
                                    child: 'Choose file'.interTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  height: 30,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 4, bottom: 4),
                                    child: ''.interTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        30.0.addHSpace(),
                        SizedBox(
                          height: 37,
                          width: 100,
                          child: AppBorderButton(
                            onTap: () {},
                            textSize: 14,
                            text: 'Update',
                            borderColor: darkSky,
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 15, vertical: 15),
                  ),
                  20.0.addHSpace(),
                  'Latest Articles'.interTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  10.0.addHSpace(),
                  SizedBox(
                    height: 165,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const AppArticlesCard(
                            descColor: Colors.black,
                            desc:
                                'Diabetes - What you need to knowabout this condition',
                            image: Assets.imagesWorkoutImg);
                      },
                    ),
                  ),
                  20.0.addHSpace(),
                  'FAQs'.interTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  20.0.addHSpace(),
                  SizedBox(
                    // height: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return expandedTile(
                                'How do I add a user to my account?', () {
                          ctrl.index.value = index;
                          ctrl.update();
                          if (ctrl.index.value == index) {
                            if (ctrl.visibility.value == true) {
                              ctrl.changed(false, "text");
                            } else {
                              ctrl.changed(true, "text");
                            }
                          }
                        },
                                isExpandable: ctrl.index.value == index
                                    ? ctrl.visibility.value
                                    : false)
                            .paddingOnly(bottom: 10);
                      },
                    ),
                  ),

                  /*expandedTile('How do I add a user to my account?', () {
                  if (ctrl.visibility.value == true) {
                    ctrl.changed(false, "text");
                  } else {
                    ctrl.changed(true, "text");
                  }
                }, isExpandable: ctrl.visibility.value),*/
                ],
              )),
        );
      }),
    );
  }
}
