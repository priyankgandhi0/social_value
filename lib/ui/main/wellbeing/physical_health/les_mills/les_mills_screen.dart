import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import 'less_mills_controller.dart';

class PhysicalHealthLesMills extends StatelessWidget {
  PhysicalHealthLesMills({Key? key}) : super(key: key);
  final LessMillsController controller = Get.put(LessMillsController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: GetBuilder<LessMillsController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getVideoCategories());
              // controller.videoCategoryItem.clear();
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 311,
                    width: double.infinity,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 3,
                          offset: const Offset(2, 2))
                    ], borderRadius: BorderRadius.circular(8), color: white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.imagesLessmills,
                            color: Colors.black,
                          ),
                          20.0.addHSpace(),
                          lessmillsDesc.interTextStyle(
                              maxLines: 12,
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 13,
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    ),
                  ),
                  20.0.addHSpace(),
                  chooseYourWorkout.interTextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  15.0.addHSpace(),
                  controller.videoCategoryItem.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          itemCount: ctrl.videoCategoryItem.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 9 / 7
                                  // mainAxisSpacing: 10,
                                  ),
                          itemBuilder: (BuildContext context, int index) {
                            return WorkOutCard(
                              onTap: () {
                                Get.toNamed(Routes.workOutVideoScreen,
                                    arguments: [
                                      {
                                        "title":
                                            ctrl.videoCategoryItem[index].title
                                      },
                                      {"id": ctrl.videoCategoryItem[index].id}
                                    ]);
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (BuildContext context) {
                                //   return WorkOutVideoScreen(
                                //     title: ctrl.videoCategoryList[index].title,
                                //   );
                                // }));
                              },
                              title: ctrl.videoCategoryItem[index].title,
                              image: Assets.imagesWorkoutImg,
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
                color: darkDeepPurple,
              )
            : Container()),
      ],
    );
  }
}
