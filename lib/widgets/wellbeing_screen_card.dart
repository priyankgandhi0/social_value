import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:social_value/utils/extension.dart';

import '../theme/app_color.dart';
import 'app_button.dart';

class WellBeingScore extends StatelessWidget {
  WellBeingScore({
    Key? key,
    required this.scoreTitle,
    required this.scoreDesc,
    required this.percentage,
    required this.bgColor,
    required this.percentageColor,
    this.scoreTitleColor,
    this.scoreDescColor,
  }) : super(key: key);

  String scoreTitle;
  String scoreDesc;
  double percentage = 0.0;
  Color bgColor;
  Color percentageColor;
  Color? scoreTitleColor;
  Color? scoreDescColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      color: bgColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: CircularPercentIndicator(
                  radius: 55.0,
                  lineWidth: 7.0,
                  percent: percentage,
                  center: Text("100%"),
                  progressColor: percentageColor,
                )).paddingOnly(left: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  scoreTitle.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      fontColor: scoreTitleColor ?? Colors.black),
                  25.0.addHSpace(),
                  scoreDesc.interTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontColor: scoreDescColor ?? Colors.black),
                ],
              ).paddingSymmetric(horizontal: 10),
            )
          ]).paddingSymmetric(vertical: 15),
    );
  }
}

class WellBeingCard extends StatelessWidget {
  WellBeingCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    required this.titleColor,
    required this.descColor,
  }) : super(key: key);

  String title;
  String desc;
  String image;
  Color? titleColor;
  Color? descColor;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: 300,
          width: 200,
        ),
      ),
      10.0.addHSpace(),
      Expanded(
        child: SizedBox(
          height: 300,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              title.interTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  textAlign: TextAlign.center,
                  fontColor: titleColor ?? Colors.black),
              desc.interTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  maxLines: 5,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  fontColor: descColor ?? Colors.black),
              BorderButton(
                appBorderFillColor: Colors.white,
                appFillColor: Colors.transparent,
                onTap: () {},
                text: 'Access Now',
                value: 10,
              ).paddingSymmetric(horizontal: 20)
            ],
          ),
        ),
      )
    ]).paddingSymmetric(horizontal: 10);
  }
}

class CenterImageCard extends StatelessWidget {
  CenterImageCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    required this.titleColor,
    required this.descColor,
  }) : super(key: key);

  String title;
  String desc;
  String image;
  Color? titleColor;
  Color? descColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          desc.interTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              maxLines: 5,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              fontColor: descColor ?? Colors.black),
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 100,
            width: Get.size.width,
          ),
          BorderButton(
            appBorderFillColor: Colors.white,
            appFillColor: Colors.transparent,
            onTap: () {},
            text: 'Access Now',
            value: 10,
          ).paddingSymmetric(horizontal: 20)
        ],
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}

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
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
                child: desc.interTextStyle(
                    fontWeight: FontWeight.w700,
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

class AppDiscountCard extends StatelessWidget {
  AppDiscountCard({
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: 300,
      width: Get.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          10.0.addHSpace(),
          'Get Your Free XO Discount Card'.interTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              maxLines: 4,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              fontColor: descColor ?? Colors.black),
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 165,
            width: 165,
          ),
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
                )
              : Container()
        ],
      ).paddingSymmetric(horizontal: 5),
    ).paddingSymmetric(horizontal: 10);
  }
}
