import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';
import '../../physical_health/articles/article_controller.dart';

class FinancesDashBoard extends StatelessWidget {
  FinancesDashBoard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: GetBuilder<ArticleController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getArticles("42"));
              controller.articlesList.clear();
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  financesHome.interTextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                  10.0.addHSpace(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    // margin: const EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffF4F4F4)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(2, 2),
                              blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        lookingForFinancialSupport.interTextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                        8.0.addHSpace(),
                        supportServicesToHelp.interTextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                        8.0.addHSpace(),
                        Image.asset(ImageAssets.financesCard)
                      ],
                    ),
                  ),
                  20.0.addHSpace(),
                  const XoDiscountCard(
                    fillColor: lightDeepPurple,
                    image: Assets.imagesCreditCard,
                    appBorderFillColor: darkDeepPurple,
                    desc: memberShipDesc,
                  ),
                  20.0.addHSpace(),
                  latestArticlesText.interTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontColor: textColor),
                  10.0.addHSpace(),
                  SizedBox(
                    height: 165,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AppArticlesCard(
                            onTap: () {
                              Get.toNamed(Routes.articleDetailScreen,
                                  arguments: [
                                    {
                                      "text": "Finances",
                                    },
                                    {"color": darkDeepPurple},
                                    {"color1": darkDeepPurple},
                                    {"id": ctrl.articlesList[index].id}
                                  ]);
                            },
                            descColor: Colors.black,
                            desc: ctrl.articlesList[index].title,
                            image: ctrl.articlesList[index].featuredImage);
                      },
                    ),
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
            : Container())
      ],
    );
  }
}
