import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/help_support/help_support_controller.dart';
import 'package:social_value/utils/extension.dart';

import '../../../generated/assets.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/common_card.dart';
import '../../../widgets/common_textfield.dart';
import '../../../widgets/expanable_widget.dart';

class HelpSupport extends StatelessWidget {
  HelpSupport({Key? key}) : super(key: key);
  var controller = Get.put(HelpSupportController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpSupportController>(builder: (ctrl) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              100.0.addHSpace(),
              Container(
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
                    const StartUpTextFiled(
                      headingText: 'Name',
                      headingTextColor: Colors.black,
                      hintText: 'Enter your name',
                      fillColor: Colors.transparent,
                      borderColor: Colors.grey,
                      fontColor: Colors.black,
                    ),
                    10.0.addHSpace(),
                    const StartUpTextFiled(
                      headingText: 'Email',
                      headingTextColor: Colors.black,
                      hintText: 'Enter your email',
                      fillColor: Colors.transparent,
                      borderColor: Colors.grey,
                      fontColor: Colors.black,
                    ),
                    10.0.addHSpace(),
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
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: 'Choose file'.interTextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            )),
                        5.0.addWSpace(),
                        Expanded(
                          flex: 1,
                          child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
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
                    10.0.addHSpace(),
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
              10.0.addHSpace(),
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
                    return AppArticlesCard(
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
              10.0.addHSpace(),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return expandedTile('How do I add a user to my account?', () {
                    ctrl.index.value = index;
                    ctrl.update();
                    if (ctrl.index.value == index) {
                      if (ctrl.visibility.value == true) {
                        ctrl.changed(false, "text");
                      } else {
                        ctrl.changed(true, "text");
                      }
                    }
                  }, isExpandable: ctrl.index.value == index);
                },
              ),

              /*expandedTile('How do I add a user to my account?', () {
                if (ctrl.visibility.value == true) {
                  ctrl.changed(false, "text");
                } else {
                  ctrl.changed(true, "text");
                }
              }, isExpandable: ctrl.visibility.value),*/
              20.0.addHSpace(),
            ],
          ).paddingSymmetric(horizontal: 10),
        ),
      );
    });
  }
}
