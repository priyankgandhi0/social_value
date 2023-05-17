import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../constant/requst_const.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../../physical_health/articles/article_controller.dart';

class MentalHealthArticles extends StatelessWidget {
  MentalHealthArticles({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
            child: GetBuilder<ArticleController>(initState: (state) {
              controller.articlesList.clear();
              Future.delayed(Duration.zero).then(
                  (value) => controller.getArticles(MethodIDs.mentalArticle));
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      mentalHealthSupportArticles.interTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontColor: textColor),
                    ],
                  ).paddingOnly(left: 10),
                  18.0.addHSpace(),
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
                                "text": "mental health",
                              },
                              {"color": darkDeepPurple},
                              {"color1": darkDeepPurple},
                              {"id": ctrl.articlesList[index].id}
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
                color: darkDeepPurple,
              )
            : Container()),
      ],
    );
  }
}
