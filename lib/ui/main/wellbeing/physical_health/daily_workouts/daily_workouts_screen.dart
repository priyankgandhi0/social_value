import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../../../dashboard_screen/dashboard_contorller.dart';

class PhysicalHealthDailyWorkOut extends StatelessWidget {
  PhysicalHealthDailyWorkOut({Key? key}) : super(key: key);
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
            child: GetBuilder<DashboardController>(initState: (state) {
              controller.getVideo.clear();
              Future.delayed(Duration.zero)
                  .then((value) => controller.getVideos("67"));
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      dailyWorkouts.interTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontColor: textColor),
                    ],
                  ).paddingOnly(left: 10),
                  18.0.addHSpace(),
                  ctrl.getVideo.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          itemCount: ctrl.getVideo.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 2 / 2.1
                                  // mainAxisSpacing: 10,
                                  ),
                          itemBuilder: (BuildContext context, int index) {
                            // if (ctrl.videoCategoryList[index].parentCategoryId == "72") {
                            //   ctrl.videoId.add(ctrl.videoCategoryList[index].toJson());
                            //   print("videoData---${}")
                            // }
                            return AppVideoCard(
                              url: ctrl.getVideo[index].videoUrl,
                              onTap: () {
                                Get.toNamed(Routes.videoPlayerScreen,
                                    arguments: {
                                      "url": ctrl.getVideo[index].videoUrl
                                    });
                              },
                              title: ctrl.getVideo[index].title,
                              image: ctrl.getVideo[index].thumbnail ?? "",
                            ).paddingOnly(
                              bottom: 20,
                            );
                          },
                        ),
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value || controller.isLoading.value
            ? const AppProgress(
                color: darkDeepPurple,
              )
            : Container()),
      ],
    );
  }
}
