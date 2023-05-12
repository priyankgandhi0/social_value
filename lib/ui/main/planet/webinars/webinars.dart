import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/extension.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/app_progress.dart';
import '../../../../widgets/common_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard_screen/dashboard_contorller.dart';

class WebinarsScreen extends StatefulWidget {
  const WebinarsScreen({Key? key}) : super(key: key);

  @override
  State<WebinarsScreen> createState() => _WebinarsScreenState();
}

class _WebinarsScreenState extends State<WebinarsScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.0.addHSpace(),
        DefaultTabController(
          length: 2,
          child: TabBar(
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicatorPadding: const EdgeInsets.only(bottom: 7),
            controller: controller,
            // physics: const NeverScrollableScrollPhysics(),
            indicatorWeight: 1,
            onTap: (index) {
              currentIndex = index;
            },
            indicator: indicatorWidth(darkGreen),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: darkGreen,
            automaticIndicatorColorAdjustment: true,
            labelColor: black,
            unselectedLabelColor: black,
            labelStyle: GoogleFonts.inter(
                color: white, fontWeight: FontWeight.w700, fontSize: 16),
            unselectedLabelStyle: GoogleFonts.inter(
                color: white, fontWeight: FontWeight.w700, fontSize: 16),
            tabs: [
              SizedBox(
                width: (Get.width / 2),
                child: Tab(
                  child: "Sustainability Webinars".interTextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                  width: (Get.width / 3),
                  child: Tab(
                      child: "EDI Webinars".interTextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700))),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller!,
            children: [SustainabilityWebinars(), EdiWebinars()],
          ),
        )
      ],
    );
  }
}

class SustainabilityWebinars extends StatelessWidget {
  SustainabilityWebinars({Key? key}) : super(key: key);
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
              Future.delayed(Duration.zero)
                  .then((value) => controller.getVideos("89,90"));
              controller.getVideo.clear();
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

class EdiWebinars extends StatelessWidget {
  EdiWebinars({Key? key}) : super(key: key);
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
              Future.delayed(Duration.zero)
                  .then((value) => controller.getVideos("64"));
              controller.getVideo.clear();
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
