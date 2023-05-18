import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../../../constant/requst_const.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/extension.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/app_progress.dart';
import '../../../../widgets/common_card.dart';
import '../../wellbeing/physical_health/articles/article_controller.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen>
    with SingleTickerProviderStateMixin {
  final ArticleController articleController = Get.find<ArticleController>();
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
                  child: "Sustainability Articles".interTextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              // 10.0.addWSpace(),
              SizedBox(
                  width: (Get.width / 3),
                  child: Tab(
                      child: "EDI Articles".interTextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700))),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller!,
            children: [SustainabilityArticles(), EdiArticles()],
          ),
        )
      ],
    );
  }
}

class SustainabilityArticles extends StatelessWidget {
  SustainabilityArticles({Key? key}) : super(key: key);
  final ArticleController controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 25),
            child: GetBuilder<ArticleController>(initState: (state) {
              controller.planetArticleList.clear();
              Future.delayed(Duration.zero).then((value) =>
                  controller.getArticles(MethodIDs.sustainabilityArticles));
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    itemCount: ctrl.planetArticleList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 24,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AppBodyPumptCard(
                          onTap: () {
                            Get.toNamed(Routes.articleDetailScreen, arguments: [
                              {
                                "text": "Sustainability",
                              },
                              {"color": darkGreen},
                              {"color1": darkSky},
                              {"id": ctrl.planetArticleList[index].id},
                            ]);
                          },
                          title: ctrl.planetArticleList[index].title,
                          image: ctrl.planetArticleList[index].featuredImage);
                    },
                  )
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value || controller.isLoading.value
            ? const AppProgress(
                color: darkGreen,
              )
            : Container()),
      ],
    );
  }
}

class EdiArticles extends StatelessWidget {
  EdiArticles({Key? key}) : super(key: key);
  final ArticleController controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 25),
            child: GetBuilder<ArticleController>(initState: (state) {
              controller.articlesList.clear();
              Future.delayed(Duration.zero).then(
                  (value) => controller.getArticles(MethodIDs.EdiArticles));
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    itemCount: ctrl.articlesList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 24,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AppBodyPumptCard(
                          onTap: () {
                            Get.toNamed(Routes.articleDetailScreen, arguments: [
                              {
                                "text": "EDI",
                              },
                              {"color": darkGreen},
                              {"color1": darkSky},
                              {"id": ctrl.articlesList[index].id},
                            ]);
                          },
                          title: ctrl.articlesList[index].title,
                          image: ctrl.articlesList[index].featuredImage);
                    },
                  )
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value || controller.isLoading.value
            ? const AppProgress(
                color: darkGreen,
              )
            : Container()),
      ],
    );
  }
}
