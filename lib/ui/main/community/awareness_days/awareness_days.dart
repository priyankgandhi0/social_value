import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';

import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/app_progress.dart';

import '../../../../widgets/common_card.dart';
import 'awareness_days_controller.dart';

class AwarenessDaysScreen extends StatelessWidget {
  AwarenessDaysScreen({Key? key}) : super(key: key);

  final awarenessDaysCtrl = Get.put(AwarenessDaysController());
  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: GetBuilder<AwarenessDaysController>(
              builder: (ctrl) {
                return Column(
                  children: [

                    ...ctrl.awarenessDataList.map((a) => Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffF4F4F4)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade400, blurRadius: 3, offset: const Offset(3, 3))
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          a.tittleString.interTextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          20.0.addHSpace(),
                          ...a.awarenessData.map((e) =>   AwarenessDaysCard(
                            // date: e.start.day.toString(),
                            date:   e.awarenessDay.day.toOrdinalString().toString(),
                            data: e.awarenessData,
                          )).toList(),
                          50.0.addHSpace()
                        ],
                      ),
                    ),).toList(),

                   /* GestureDetector(
                      onTap: () {
                        // awarenessDaysCtrl.processData();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF4F4F4)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey.shade400, blurRadius: 3, offset: const Offset(3, 3))
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "April 2023".interTextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                            20.0.addHSpace(),
                            const AwarenessDaysCard(
                              date: "2nd",
                              day: "Purple Day",
                              day2: "Mothering Sunday",
                              day3: "World Autism Day",
                            ),
                            27.0.addHSpace(),
                            const AwarenessDaysCard(
                              date: "23nd",
                              day: "Purple Day",
                              day2: "Mothering Sunday",
                              day3: "World Autism Day",
                            ),
                            27.0.addHSpace(),
                            const AwarenessDaysCard(
                              date: "23nd",
                              day: "Purple Day",
                              day2: "",
                              day3: "",
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.0.addHSpace(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffF4F4F4)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 3,
                                offset: const Offset(3, 3))
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "April 2023".interTextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          20.0.addHSpace(),
                          const AwarenessDaysCard(
                            date: "2nd",
                            day: "Purple Day",
                            day2: "Mothering Sunday",
                            day3: "World Autism Day",
                          ),
                          27.0.addHSpace(),
                          const AwarenessDaysCard(
                            date: "23nd",
                            day: "Purple Day",
                            day2: "Mothering Sunday",
                            day3: "World Autism Day",
                          ),
                          27.0.addHSpace(),
                          const AwarenessDaysCard(
                            date: "23nd",
                            day: "Purple Day",
                            day2: "",
                            day3: "",
                          ),
                        ],
                      ),
                    ),*/
                  ],
                );
              }
            ),
          ),
        ),


        Obx(() => Visibility(visible: awarenessDaysCtrl.isLoading.value,child: const AppProgress(color: darkPurple,),))

      ],
    );
  }
}
