import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/app_string.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/requst_const.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../articles/article_controller.dart';

class PhysicalHealthMealPlans extends StatelessWidget {
  PhysicalHealthMealPlans({Key? key}) : super(key: key);
  final ArticleController controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 20, top: 25, bottom: 25),
            child: GetBuilder<ArticleController>(initState: (state) {
              controller.articlesList.clear();
              Future.delayed(Duration.zero).then((value) => controller.getArticles(MethodIDs.mealPlanArticle));
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mealPlans.interTextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontColor: textColor).paddingOnly(left: 10),

                  18.0.addHSpace(),
                  GridView.builder(
                    itemCount: ctrl.articlesList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AppBodyPumptCard(
                        onTap: () {
                          Get.toNamed(Routes.articleDetailScreen, arguments: [
                            {"text": "Meal plan",},
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
