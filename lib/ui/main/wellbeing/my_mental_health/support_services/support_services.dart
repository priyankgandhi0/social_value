import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/ui/main/wellbeing/my_mental_health/support_services/support_services_controller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';

class SupportServices extends StatelessWidget {
  bool? isFinance = false;

  SupportServices({Key? key, this.isFinance}) : super(key: key);
  final SupportServicesController controller =
      Get.find<SupportServicesController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
            child: GetBuilder<SupportServicesController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getHelplines());
            }, builder: (ctrl) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        right: 10, left: 15, top: 10, bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffEFC4C4)),
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffF5D3D3)),
                    child: ifYouNeedImmediate.interTextStyle(
                        fontColor: const Color(0xffA55B5B),
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                  20.0.addHSpace(),
                  ListView.builder(
                    itemCount: ctrl.getHelplinesList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return isFinance == true
                          ? ctrl.getHelplinesList[index].id == '2'
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (ctrl.getHelplinesList[index].title ?? "")
                                          .interTextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                              textDecoration:
                                                  TextDecoration.underline),
                                      20.0.addHSpace(),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: ctrl
                                              .getHelplinesList[index]
                                              .items
                                              ?.length,
                                          itemBuilder: (context, i) {
                                            return AddictionCard(
                                              title:
                                                  '${ctrl.getHelplinesList[index].items![i].title} - ',
                                              desc: ctrl.getHelplinesList[index]
                                                      .items![i].phone.isEmpty
                                                  ? ''
                                                  : '${ctrl.getHelplinesList[index].items![i].phone} - ',
                                              webLink: ctrl
                                                  .getHelplinesList[index]
                                                  .items![i]
                                                  .website,
                                              color: i.isEven
                                                  ? lightDeepPurple
                                                  : white,
                                            );
                                          }),
                                    ],
                                  ),
                                ).paddingOnly(bottom: 20)
                              : Container()
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              // height: 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (ctrl.getHelplinesList[index].title ?? "")
                                      .interTextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          textDecoration:
                                              TextDecoration.underline),
                                  20.0.addHSpace(),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: ctrl.getHelplinesList[index]
                                          .items?.length,
                                      itemBuilder: (context, i) {
                                        return AddictionCard(
                                          title:
                                              '${ctrl.getHelplinesList[index].items![i].title} - ',
                                          desc: ctrl.getHelplinesList[index]
                                                  .items![i].phone.isEmpty
                                              ? ''
                                              : '${ctrl.getHelplinesList[index].items![i].phone} - ',
                                          webLink: ctrl.getHelplinesList[index]
                                              .items![i].website,
                                          color: i.isEven
                                              ? lightDeepPurple
                                              : white,
                                        );
                                      }),
                                ],
                              ),
                            ).paddingOnly(bottom: 20);
                    },
                  ),
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value
            ? const AppProgress(
                color: darkDeepPurple,
              )
            : Container()),
      ],
    );
  }
}
