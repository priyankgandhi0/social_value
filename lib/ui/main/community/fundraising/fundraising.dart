import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/common_card.dart';
import '../../../../constant/app_string.dart';
import '../../../../models/fundraising_model.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/app_progress.dart';
import 'fundraising_controller.dart';

class FundraisingScreen extends StatelessWidget {
  FundraisingScreen({Key? key}) : super(key: key);
  final FundraisingController controller = Get.put(FundraisingController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: GetBuilder<FundraisingController>(initState: (state) {
          Future.delayed(Duration.zero)
              .then((value) => controller.getFundraisingIdeas());
        }, builder: (ctrl) {
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        ImageAssets.fundraising,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  30.0.addHSpace(),
                  Container(
                      // height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: lightPurple,
                          borderRadius: BorderRadius.circular(8)),
                      child: fundraisingDesc.interTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontColor: textColor)),
                  20.0.addHSpace(),
                  // ListView.builder(
                  //   itemCount: ctrl.getFundraising.length,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     var result = ctrl.getFundraising.map((f) =>
                  //         {"title": ctrl.getFundraising[index].title[0]});
                  //     print(result);
                  //     return AlcoholFreeCard(
                  //       title: ctrl.getFundraising[index].title,
                  //       desc: ctrl.getFundraising[index].description,
                  //       firstLetter: ctrl.getFundraising[index].title[0],
                  //     );
                  //   },
                  // ),
                  GroupedListView<Fundraising, String>(
                    elements: ctrl.getFundraising,
                    groupBy: (element) => element.title[0],
                    groupComparator: (value1, value2) =>
                        value2[0].compareTo(value1[0]),
                    itemComparator: (item1, item2) =>
                        (item1.title[0]).compareTo(item2.title[0]),
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: false,
                    groupSeparatorBuilder: (String value) => Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        value[0],
                      ),
                    ),
                    shrinkWrap: true,
                    indexedItemBuilder:
                        (BuildContext context, element, int index) {
                      return SizedBox(
                          height: 170,
                          child: AlcoholFreeData(
                            title: element.title,
                            desc: element.description,
                            color: darkPurple,
                            firstLetter: element.title[0],
                          ));
                    },
                  ),
                ],
              ),
              Obx(() => controller.isLoading.value || controller.isLoading.value
                  ? const AppProgress()
                  : Container()),
            ],
          );
        }),
      ),
    );
  }
}
