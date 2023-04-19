import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';

import '../theme/app_color.dart';
import 'app_button.dart';

class AppSquareCard extends StatelessWidget {
  AppSquareCard({
    Key? key,
    this.desc,
    required this.image,
    required this.descColor,
    this.btnText,
  }) : super(key: key);

  String? desc;
  String image;
  Color? descColor;
  String? btnText;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: 165,
          width: 165,
        ),
      ),
      10.0.addHSpace(),
      Expanded(
        child: SizedBox(
          height: 165,
          width: 165,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              desc != null
                  ? desc?.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      maxLines: 4,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      fontColor: descColor ?? Colors.black)
                  : Container(),
              btnText != null
                  ? BorderButton(
                      appBorderFillColor: Colors.white,
                      appFillColor: Colors.transparent,
                      onTap: () {},
                      text: btnText!,
                      fontSize: 12,
                      value: 10,
                      rightIcon: true,
                    )
                  : Container()
            ],
          ).paddingSymmetric(horizontal: 5),
        ),
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
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
        height: 165,
        width: 165,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white.withOpacity(0.7)),
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
        ));
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
        margin: const EdgeInsets.only(right: 10),
        height: 111,
        width: 188,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2,
              // spreadRadius: 2,
              offset: const Offset(1, 0))
        ], color: white, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: Get.height,
                width: Get.width,
              ),
            ),
            Center(
              child: Image.asset(
                color: Colors.black.withOpacity(0.7),
                ImageAssets.imagesPlayButton,
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
    required this.titleColor,
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
        height: 165,
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
                fontColor: titleColor ?? Colors.black),
          ),
        ));
  }
}

class AppBodyPumptCard extends StatelessWidget {
  AppBodyPumptCard({
    Key? key,
    required this.title,
    required this.image,
    required this.titleColor,
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
                    fontColor: titleColor ?? Colors.black),
              )),
        ));
  }
}
