import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/requst_const.dart';
import 'package:social_value/ui/main/dashboard_screen/dashboard_contorller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../generated/asset.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/app_progress.dart';
import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';
import '../../physical_health/articles/article_controller.dart';
import '../../wellbeing_dashboard/wellbeing_dashboard_controller.dart';

class MentalHealthDashBoard extends StatelessWidget {
  MentalHealthDashBoard({Key? key}) : super(key: key);
  final ArticleController controller = Get.put(ArticleController());
  final WellbeingController wellBeingCtrl = Get.put(WellbeingController());
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ArticleController>(initState: (state) {
        Future.delayed(Duration.zero).then((value) =>
            dashboardController.getVideos(MethodIDs.mentalDashboardVideo));
        dashboardController.getVideo.clear();
        Future.delayed(Duration.zero).then((value) =>
            controller.getArticles(MethodIDs.mentalDashboardArticle));
        controller.articlesList.clear();
      }, builder: (ctrl) {
        return Column(
          children: [
            34.0.addHSpace(),
            Row(
              children: [
                mentalHealthHome.interTextStyle(
                    fontWeight: FontWeight.w700, fontSize: 16)
              ],
            ).paddingOnly(left: 20),
            23.0.addHSpace(),


            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 319,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: darkDeepPurple,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [

                        34.0.addHSpace(),

                        '''Access the #1 app for sleep. anxiety, stress and mental health'''.appEpilogueTextStyle(
                            textAlign: TextAlign.center,
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                        ).paddingSymmetric(horizontal: 10),

                        19.0.addHSpace(),

                        Image.asset(ImageAssets.helthImg,height: 90,fit: BoxFit.fitHeight,).paddingSymmetric(horizontal: 10),


                        const Spacer(),

                        Container(
                          width: 155,
                          height: 31,

                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Access Now".appEpilogueTextStyle(
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12
                              )
                            ],
                          ),
                        ).paddingOnly(bottom: 17)

                      ],
                    ),
                  ).paddingOnly(right: 5,left: 20),
                ),
                10.0.addWSpace(),
                Expanded(
                  child: AppRactangleCard(
                    height: 319,
                    width: double.infinity,
                    desc: '''${wellBeingCtrl.getAffirmationModal.isEmpty ? "" : wellBeingCtrl.getAffirmationModal[0].text}''',
                    btnText: null,
                    isTextShow : true,
                    image: ImageAssets.treeImage,
                    descColor: Colors.white,
                    onTap: () {},
                  ).paddingOnly(
                    right: 20,
                  ),
                ),
              ],
            ),
            40.0.addHSpace(),
            Row(
              children: [
                escapeWithMinuteMindFulNessVideos.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(left: 20),
            10.0.addHSpace(),
            Obx(
              () => controller.isLoading.value
                  ? SizedBox(
                      height: 113,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return const ShimmerEffect();
                        },
                      ),
                    ).paddingOnly(left: 10, right: 10)
                  : SizedBox(
                      height: 123,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dashboardController.getVideo.length,
                        cacheExtent: 1000,
                        shrinkWrap: true,
                        // key: const PageStorageKey(),
                        addAutomaticKeepAlives: false,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                              height: 111,
                              width: 188,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade600,
                                        blurRadius: 2,
                                        offset: const Offset(3, 3))
                                  ],
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    children: [
                                      // Image.file(
                                      //   File(dashboardController
                                      //       .getVideo[index].thumbnail!),
                                      //   errorBuilder: (context, error, trace) {
                                      //     return const Center(
                                      //         child:
                                      //             CircularProgressIndicator());
                                      //   },
                                      //   height: 111,
                                      //   width: 188,
                                      //   fit: BoxFit.cover,
                                      // ),

                                      VideoThumbnailCard(image: dashboardController.getVideo[index].thumbnail!),

                                      Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.videoPlayerScreen,
                                                arguments: {
                                                  "url": dashboardController
                                                      .getVideo[index].videoUrl
                                                });
                                          },
                                          child: Image.asset(
                                            color: darkDeepPurple
                                                .withOpacity(0.8),
                                            Assets.imagesPlayButton,
                                            fit: BoxFit.cover,
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )

                          );
                        },
                      ),
                    ).paddingOnly(left: 10, right: 10),
            ),
            30.0.addHSpace(),



            Row(
              children: [
                Expanded(
                  child: AppSquareCard(
                    height: 166,
                    onTap: () {
                      Get.offAndToNamed(Routes.mentalHealthMain,
                          arguments: {"selectedPage": 6});
                    },
                    iconVisible: false,
                    desc: '',
                    btnText: null,
                    image: ImageAssets.friendImage,
                    descColor: Colors.white,
                    stackWidget: Stack(
                      alignment: Alignment.topCenter,
                      children: [

                        SvgPicture.asset('assets/icons/atozIcon.svg',height: 40,width: 40,).paddingOnly(top: 50),
                        SvgPicture.asset('assets/icons/supportServiceIcon.svg',height: 40,width: 40,).paddingOnly(top: 70),
                        SvgPicture.asset('assets/icons/inUkIcon.svg',height: 40,width: 40,).paddingOnly(top: 100),
                      ],
                    ),
                  ).paddingOnly(left: 10,right: 5),
                ),
                Expanded(
                  child: AppSquareCard(
                    height: 166,
                    onTap: () {
                      Get.offAndToNamed(Routes.mentalHealthMain,
                          arguments: {"selectedPage": 3});
                    },
                    iconVisible: false,
                    desc: '',
                    btnText: null,
                    image: ImageAssets.relaxImage,
                    descColor: Colors.white,
                    stackWidget: Container(
                       padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: '''Relax with our Yoga Videos'''.interTextStyle(fontWeight: FontWeight.w500,fontSize: 16,fontColor: Colors.black,textAlign: TextAlign.center),
                    ).paddingSymmetric(horizontal: 20),
                  ),
                ),
              ],
            ).paddingOnly(left: 10, right: 10),
            30.0.addHSpace(),
            Row(
              children: [
                latestArticlesText.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(
              left: 20,
            ),
            10.0.addHSpace(),
            ctrl.articlesList.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: 165,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AppArticlesCard(
                          width: 188,
                            paddingRight: 10,
                            onTap: () {
                              Get.toNamed(Routes.articleDetailScreen,
                                  arguments: [
                                    {
                                      "text": "mental health",
                                    },
                                    {"color": darkDeepPurple},
                                    {"color1": darkDeepPurple},
                                    {"id": controller.articlesList[index].id}
                                  ]);
                            },
                            descColor: Colors.black,
                            desc: ctrl.articlesList[index].title,
                            image: ctrl.articlesList[index].featuredImage).paddingOnly(left: 10);
                      },
                    ),
                  ).paddingOnly(left: 10, right: 10),
            30.0.addHSpace(),
          ],
        );
      }),
    ).paddingOnly(bottom: 20);
  }
}
