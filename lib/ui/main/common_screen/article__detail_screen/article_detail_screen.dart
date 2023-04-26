import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';
import '../../bottom_nav_bar/bottom_navigation_screen.dart';

class ArticleDetailScreen extends StatelessWidget {
  ArticleDetailScreen({
    Key? key,
    // this.text,
  }) : super(key: key);
  // final String? text;
  dynamic data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      color: data[1]["color"],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                // height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageAssets.articleLadyImage),
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
                      child: articleDesc.appEpilogueTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontColor: Colors.white),
                    ),
                    30.0.addHSpace(),
                    Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: data[2]["color1"],
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: data[0]["text"].toString().interTextStyle(
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              fontColor: Colors.white),
                        )).paddingSymmetric(
                      horizontal: 20,
                    ),
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
                      introduction.interTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          fontColor: textColor),
                      10.0.addHSpace(),
                      introductionDesc.interTextStyle(
                          fontColor: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      20.0.addHSpace(),
                      introduction.interTextStyle(
                          fontColor: textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      10.0.addHSpace(),
                      introductionDesc.interTextStyle(
                          fontColor: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ]),
              ),
            )
          ],
        ).paddingOnly(bottom: 30),
      ),
    );
  }
}
