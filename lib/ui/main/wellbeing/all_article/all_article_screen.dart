import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/articles/article_controller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';

class AllArticleScreen extends StatelessWidget {
  AllArticleScreen({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 20, top: 25, bottom: 25),
                child: GetBuilder<ArticleController>(initState: (state) {
                  Future.delayed(Duration.zero)
                      .then((value) => controller.getArticleCategories());
                  controller.articleCategoryItem.clear();
                  Future.delayed(Duration.zero).then((value) =>
                      controller.getArticles(
                          "33,38,41,40,32,37,30,39,36,49,31,35,34,29"));
                  controller.articleType = "All";
                  controller.articlesList.clear();
                }, builder: (ctrl) {
                  return Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              "Wellbeing Article".interTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontColor: textColor),
                            ],
                          ).paddingOnly(left: 10),
                          15.0.addHSpace(),
                          Row(
                            children: [
                              "Filter by category".interTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontColor: textColor),
                            ],
                          ).paddingOnly(left: 10),
                          18.0.addHSpace(),
                          GestureDetector(
                            onTap: () {
                              ctrl.isOpen = !ctrl.isOpen;
                            },
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    (ctrl.articleType).interTextStyle(
                                        fontColor: textColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        textAlign: TextAlign.start),
                                    const Icon(Icons.keyboard_arrow_down),
                                  ],
                                ).paddingOnly(left: 10, right: 10)),
                          ).paddingOnly(left: 10),
                          5.0.addHSpace(),
                          ctrl.isOpen
                              ? AnimatedContainer(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0XFFDADADA),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  duration: const Duration(seconds: 1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              ctrl.articleType = "All";
                                              ctrl.getArticles(
                                                  "33,38,41,40,32,37,30,39,36,49,31,35,34,29");
                                              ctrl.articlesList.clear();
                                              ctrl.isOpen = !ctrl.isOpen;
                                              ctrl.update();
                                            },
                                            child: Row(
                                              children: [
                                                "All".interTextStyle(
                                                    fontColor: textColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    textAlign: TextAlign.start)
                                              ],
                                            ).paddingOnly(left: 8),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                ctrl.articleCategoryItem.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  ctrl.articleType = ctrl
                                                      .articleCategoryItem[
                                                          index]
                                                      .title;
                                                  ctrl.getArticles(ctrl
                                                      .articleCategoryItem[
                                                          index]
                                                      .id);
                                                  ctrl.articlesList.clear();
                                                  ctrl.isOpen = !ctrl.isOpen;
                                                  ctrl.update();
                                                },
                                                child: SizedBox(
                                                  width: Get.width,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ctrl
                                                        .articleCategoryItem[
                                                            index]
                                                        .title
                                                        .interTextStyle(
                                                            fontColor:
                                                                textColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                            textAlign: TextAlign
                                                                .start),
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ]),
                                  ),
                                ).paddingOnly(left: 10)
                              : const SizedBox(),
                          15.0.addHSpace(),
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
                                  Get.toNamed(Routes.articleDetailScreen,
                                      arguments: [
                                        {
                                          "text": "physical health",
                                        },
                                        {"color": darkDeepPurple},
                                        {"color1": darkDeepPurple},
                                        {"id": ctrl.articlesList[index].id}
                                      ]);
                                },
                                title: ctrl.articlesList[index].title,
                                image: ctrl.articlesList[index].featuredImage,
                              );
                            },
                          )
                        ],
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
        ),
      ),
    );
  }
}
