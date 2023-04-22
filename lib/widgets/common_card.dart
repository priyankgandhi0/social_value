import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_value/utils/extension.dart';

import '../constant/app_string.dart';
import '../generated/asset.dart';
import '../generated/assets.dart';
import '../theme/app_color.dart';
import 'app_button.dart';

class AppSquareCard extends StatelessWidget {
  AppSquareCard({
    Key? key,
    this.desc,
    required this.image,
    this.descColor,
    this.btnText,
    this.height,
    this.width,
    this.iconVisible,
  }) : super(key: key);

  double? height;
  double? width;
  String? desc;
  String image;

  Color? descColor;
  String? btnText;
  bool? iconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: height ?? 165,
          width: width ?? 165,
        ),
      ),
      10.0.addHSpace(),
      SizedBox(
        height: height ?? 165,
        width: width ?? 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            25.0.addHSpace(),
            desc != null
                ? desc?.interTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    maxLines: 7,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    fontColor: descColor ?? Colors.black)
                : Container(),
            25.0.addHSpace(),
            btnText != null
                ? SizedBox(
                    height: 30,
                    width: 150,
                    child: BorderButton(
                      appBorderFillColor: Colors.white,
                      appFillColor: Colors.transparent,
                      onTap: () {},
                      text: btnText!,
                      fontSize: 12,
                      value: 7,
                      rightIcon: iconVisible ?? true,
                    ).paddingSymmetric(horizontal: 5),
                  )
                : Container()
          ],
        ).paddingSymmetric(horizontal: 5),
      )
    ]).paddingSymmetric(horizontal: 10);
  }
}

class AppArticlesCard extends StatelessWidget {
  AppArticlesCard({
    Key? key,
    required this.desc,
    required this.image,
    required this.descColor,
    this.btnText,
  }) : super(key: key);

  String desc;
  String image;
  Color? descColor;
  String? btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 2,
                  // spreadRadius: 2,
                  offset: const Offset(1, 0))
            ],
            borderRadius: BorderRadius.circular(11),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        height: 165,
        width: 165,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
                child: desc.interTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    maxLines: 4,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    fontColor: descColor ?? Colors.black),
              ),
            ),
          ),
        )).paddingSymmetric(horizontal: 10);
  }
}

class AppVideoCommonCard extends StatelessWidget {
  AppVideoCommonCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        height: 111,
        width: 188,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 3,
              offset: const Offset(4, 4))
        ], color: white, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: Get.height,
                width: Get.width,
              ),
            ),
            Center(
              child: Image.asset(
                color: Colors.grey.shade300.withOpacity(0.9),
                Assets.imagesPlayButton,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ],
        ));
  }
}

class AppWorkOutCard extends StatelessWidget {
  AppWorkOutCard({
    Key? key,
    required this.title,
    required this.image,
    this.titleColor,
  }) : super(key: key);

  String title;
  String image;
  Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        height: 100,
        width: 165,
        child: Container(
          alignment: Alignment.center,
          child: ClipRect(
            child: title.interTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                maxLines: 4,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                fontColor: titleColor ?? white),
          ),
        ));
  }
}

class InsuranceCard extends StatelessWidget {
  const InsuranceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 188,
      decoration: BoxDecoration(
          color: darkDeepPurple, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            car.interTextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, fontColor: white),
            5.0.addHSpace(),
            insurance.interTextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, fontColor: white),
            40.0.addHSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset(ImageAssets.car)],
            )
          ],
        ),
      ),
    ).paddingOnly(bottom: 10);
  }
}

/*class AppBodyPumptCard extends StatelessWidget {
  AppBodyPumptCard({
    Key? key,
    required this.title,
    required this.image,
    this.titleColor,
  }) : super(key: key);

  String title;
  String image;
  Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
        height: 185,
        width: 180,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
              alignment: Alignment.center,
              height: 65,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: title.interTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    maxLines: 4,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    fontColor: titleColor ?? textColor),
              )),
        ));
  }
}*/

class AppBodyPumptCard extends StatelessWidget {
  AppBodyPumptCard({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
    this.titleColor,
  }) : super(key: key);

  String title;
  String image;
  Color? titleColor;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 185,
          // width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 3,
                    offset: const Offset(2, 2))
              ]),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Container(
                  height: 116,
                  // width: 170,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    height: 65,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: title.interTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          maxLines: 4,
                          textOverflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          fontColor: titleColor ?? textColor),
                    )),
              ),
            ],
          )),
    ).paddingOnly(left: 10);
  }
}

class WorkOutCard extends StatelessWidget {
  WorkOutCard({
    Key? key,
    required this.title,
    required this.image,
    this.titleColor,
  }) : super(key: key);

  String title;
  String image;
  Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: title.interTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  maxLines: 4,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  fontColor: titleColor ?? white),
            )
          ],
        ));
  }
}
