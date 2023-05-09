import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: GetBuilder<FundraisingController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getFundraisingIdeas());
            }, builder: (ctrl) {
              return Column(
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
                  ListView.builder(
                    itemCount: listAlphabet.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AlcoholFreeCard(
                        firstLetter: listAlphabet[index].toUpperCase(),
                        data: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...ctrl.getFundraising
                                  .map(
                                    (e) => e.title.isNotEmpty
                                        ? Visibility(
                                            visible: listAlphabet[index]
                                                    .trim()
                                                    .toLowerCase() ==
                                                (e.title.trim()[0])
                                                    .toLowerCase(),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                e.title.interTextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                                10.0.addHSpace(),
                                                e.description.interTextStyle(
                                                    maxLines: 8,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)
                                              ],
                                            ).paddingOnly(bottom: 10),
                                          )
                                        : const SizedBox(),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value
            ? const AppProgress(
                color: darkPurple,
              )
            : Container()),
      ],
    );
  }
}
