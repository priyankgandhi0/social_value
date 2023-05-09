import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/ui/main/bottom_nav_bar/bottom_navigation_screen.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/common_card.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/app_progress.dart';
import '../dashboard_screen/dashboard_contorller.dart';

class WorkOutVideoScreen extends StatelessWidget {
  WorkOutVideoScreen({
    Key? key,
  }) : super(key: key);

  dynamic data = Get.arguments;
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
        color: darkDeepPurple,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: GetBuilder<DashboardController>(initState: (state) {
                controller.getVideo.clear();
                Future.delayed(Duration.zero)
                    .then((value) => controller.getVideos(data[1]['id']));
              }, builder: (ctrl) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: "Less Mills -${data[0]['title']}"
                          .appEpilogueTextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              fontColor: textColor),
                    ),
                    GridView.builder(
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
                            Get.toNamed(Routes.videoPlayerScreen, arguments: {
                              "url": ctrl.getVideo[index].videoUrl
                            });
                          },
                          title: ctrl.getVideo[index].title,
                          image: ctrl.getVideo[index].thumbnail ?? "",
                        ).paddingOnly(
                          bottom: 20,
                        );
                      },
                    ).paddingOnly(left: 10, right: 20),
                  ],
                ).paddingOnly(top: 30, bottom: 30);
              }),
            ),
            Obx(() => controller.isLoading.value
                ? const AppProgress(
                    color: darkDeepPurple,
                  )
                : Container()),
          ],
        ));
  }
}
