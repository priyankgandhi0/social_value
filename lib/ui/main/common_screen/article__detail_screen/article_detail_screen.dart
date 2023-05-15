import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/app_progress.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';
import 'article_detail_controller.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  dynamic data = Get.arguments;
  final ArticleDetailController controller = Get.put(ArticleDetailController());
  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      bottomColor: data[1]["color"],
      backGround: white,
      color: data[1]["color"],
      child: Stack(
        children: [
          SingleChildScrollView(
            child: GetBuilder<ArticleDetailController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getSingleArticle(data[3]["id"]));
            }, builder: (ctrl) {
              return Column(
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(ctrl.singleArticle.isNotEmpty
                                  ? ctrl.singleArticle[0].featuredImage
                                  : ""),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 20,
                              )).paddingSymmetric(horizontal: 0, vertical: 30),
                          40.0.addHSpace(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ctrl.singleArticle.isNotEmpty
                                ? ctrl.singleArticle[0].title
                                    .appEpilogueTextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        fontColor: Colors.white)
                                : const SizedBox(),
                          ),
                          30.0.addHSpace(),
                          Obx(() => ctrl.isLoading.value
                              ? const SizedBox()
                              : Container(
                                  height: 30,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: data[2]["color1"],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: data[0]["text"]
                                        .toString()
                                        .interTextStyle(
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            fontColor: Colors.white),
                                  )).paddingSymmetric(
                                  horizontal: 20,
                                )),
                          50.0.addHSpace(),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            child: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              height: 20,
                              width: double.infinity,
                              // width: Get.size.width,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 10, bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Html(
                              data: ctrl.singleArticle.isNotEmpty
                                  ? ctrl.singleArticle[0].html
                                  : "",
                            ),
                          ]),
                    ),
                  )
                ],
              ).paddingOnly(bottom: 30);
            }),
          ),
          Obx(() => controller.isLoading.value || controller.isLoading.value
              ? AppProgress(
                  color: data[1]["color"],
                )
              : Container()),
        ],
      ),
    );
  }
}
