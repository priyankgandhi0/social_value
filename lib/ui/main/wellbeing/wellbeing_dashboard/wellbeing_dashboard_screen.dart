import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/ui/main/wellbeing/wellbeing_dashboard/wellbeing_dashboard_controller.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../constant/requst_const.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/routes_manager.dart';
import '../../../../widgets/app_progress.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/wellbeing_screen_card.dart';
import '../../dashboard_screen/dashboard_contorller.dart';
import '../my_mental_health/support_services/support_services_controller.dart';
import '../physical_health/articles/article_controller.dart';
import '../physical_health/les_mills/less_mills_controller.dart';

class WellBeingDashBoardScreen extends StatelessWidget {
  WellBeingDashBoardScreen({Key? key}) : super(key: key);
  final DashboardController controller = Get.put(DashboardController());
  final ArticleController articleController = Get.put(ArticleController());
  final WellbeingController wellbeingController =
      Get.put(WellbeingController());
  final LessMillsController lessMillsController =
      Get.find<LessMillsController>();
  final SupportServicesController servicesController =
      Get.find<SupportServicesController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<DashboardController>(initState: (state) {
        controller.getVideo.clear();
        articleController.articlesList.clear();

        Future.delayed(Duration.zero).then(
            (value) => controller.getVideos(MethodIDs.wellbeingDashboardYoga));
        Future.delayed(Duration.zero).then((value) =>
            articleController.getArticles(MethodIDs.wellbeingDashboardArticle));
        Future.delayed(Duration.zero)
            .then((value) => wellbeingController.getCompany());
      }, builder: (ctrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WellBeingScore(
              scoreTitle: scoreTitle,
              scoreDesc: scoreDesc,
              percentage: double.parse(wellbeingController.companyData?.wellbeingScore ?? "0") /
                  100,
              bgColor: deepPurple,
              percentageColor: darkDeepPurple,
              score: wellbeingController.companyData?.wellbeingScore ?? "0",
            ),
            10.0.addHSpace(),
            Row(
              children: [

                Expanded(
                  child: const LesMillsCard(
                    image: 'assets/images/lessMillsbackImg.png',
                    insidePadding: 10,
                    topSideHeight: 60,
                    textButtonBetWeen: 30,
                    cardHeight: 340,
                  ).paddingOnly(left: 10),
                ),

                15.0.addWSpace(),

                Expanded(
                  child: Container(
                    height: 340,
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
                        ).paddingOnly(bottom: 14,left: 10,right: 10)

                      ],
                    ),
                  ).paddingOnly(right: 10,left: 0),
                ),

              ],
            ),
            30.0.addHSpace(),
            Row(
              children: [
                trySomeYoga.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(left: 10),
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
                          return const ShimmerEffect(
                            width: 180,
                          );
                        },
                      ),
                    ).paddingOnly(left: 0, right: 10)
                  : SizedBox(
                      height: 123,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ctrl.getVideo.length,
                        cacheExtent: 1000,
                        shrinkWrap: true,
                        addAutomaticKeepAlives: false,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 20, left: 0, bottom: 10),
                              height: 111,
                              width: 180,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade600,
                                        blurRadius: 2,
                                        offset: const Offset(3, 3))
                                  ],
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    children: [


                                      // Image.file(
                                      //   File(ctrl.getVideo[index].thumbnail ??
                                      //       ""),
                                      //   errorBuilder: (context, error, trace) {
                                      //     return const Center(
                                      //         child:
                                      //             CircularProgressIndicator());
                                      //   },
                                      //   height: 111,
                                      //   width: 188,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      ///
                                      VideoThumbnailCard(image: ctrl.getVideo[index].thumbnail.toString(),),

                                      Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.videoPlayerScreen,
                                                arguments: {
                                                  "url": ctrl
                                                      .getVideo[index].videoUrl
                                                });
                                          },
                                          child: Image.asset(
                                            // color: deepPurple.withOpacity(0.8),
                                            color: darkDeepPurple.withOpacity(0.8),
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
                              ));
                        },
                      ),
                    ).paddingOnly(left: 10, right: 10),
            ),
            30.0.addHSpace(),



            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      AppSquareCard(
                        width: 185,
                        height: 188,
                        onTap: () {
                          Get.toNamed(Routes.mentalHealthMain,
                              arguments: {"selectedPage": 6});
                        },
                        iconVisible: false,
                        desc: '',
                        btnText: null,
                        image: ImageAssets.supportServiceImg,
                        descColor: Colors.white,
                      ),
                      SvgPicture.asset('assets/icons/atozIcon.svg',height: 40,width: 40,).paddingOnly(top: 50),
                      SvgPicture.asset('assets/icons/supportServiceIcon.svg',height: 40,width: 40,).paddingOnly(top: 75),
                      SvgPicture.asset('assets/icons/inUkIcon.svg',height: 40,width: 40,).paddingOnly(top: 100),
                    ],
                  ).paddingOnly(left: 0,right: 0),
                ),


                5.0.addWSpace(),

                Expanded(
                  child: AppSquareCard(
                    height: 188,
                    width: 175,
                    onTap: () {
                      Get.toNamed(Routes.physicalHealthMainScreen,
                          arguments: {"selectedPage": 3});
                    },
                    desc: 'Healthy Eating Made easy with our Meal Plans',
                    btnText: 'Download Now',
                    image: ImageAssets.foodImage1,
                    descColor: Colors.white,
                  ).paddingOnly(left: 0),
                ),
              ],
            ).paddingOnly(left: 10, right: 0),
            20.0.addHSpace(),
            Row(
              children: [
                latestArticlesText.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(
              left: 10,
            ),
            10.0.addHSpace(),
            Obx(
              () => ctrl.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: darkDeepPurple,
                      ),
                    )
                  : articleController.articlesList.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 165,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: articleController.articlesList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AppArticlesCard(
                                  onTap: () {
                                    Get.toNamed(Routes.articleDetailScreen,
                                        arguments: [
                                          {"text": "Wellbeing",},
                                          {"color": darkDeepPurple},
                                          {"color1": darkDeepPurple},
                                          {"id": articleController.articlesList[index].id}
                                        ]);
                                  },
                                  descColor: Colors.black,
                                  desc: articleController.articlesList[index].title,
                                  image: articleController.articlesList[index].featuredImage);
                            },
                          ),
                        ).paddingOnly(left: 10, right: 10),
            ),
            30.0.addHSpace(),
          ],
        ).paddingOnly(bottom: 25);
      }),
    );
  }
}
