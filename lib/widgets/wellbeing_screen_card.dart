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
    required this.score,
    required this.percentage,
    required this.bgColor,
    required this.percentageColor,
    this.scoreTitleColor,
    this.scoreDescColor,
  }) : super(key: key);

  String scoreTitle;
  String scoreDesc;
  String score;
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
                    color: lightDeepPurple),
                child: CircularPercentIndicator(
                  radius: 55.0,
                  lineWidth: 7.0,
                  percent: percentage,
                  center: score.appEpilogueTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      fontColor: percentageColor),
                  progressColor: percentageColor,
                )).paddingOnly(left: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  scoreTitle.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      fontColor: scoreTitleColor ?? const Color(0xff333333)),
                  25.0.addHSpace(),
                  scoreDesc.interTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontColor: scoreDescColor ?? const Color(0xff444444)),
                ],
              ).paddingSymmetric(horizontal: 20),
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

class AppRactangleCard extends StatelessWidget {
  AppRactangleCard({
    Key? key,
    this.desc,
    this.left,
    this.right,
    this.bottom,
    this.top,
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
  double? left;
  double? right;
  double? bottom;
  double? top;
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
      btnText != null
          ? Positioned(
              left: left,
              right: right,
              top: top,
              bottom: bottom,
              child: SizedBox(
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
              ),
            )
          : Container()
    ]).paddingSymmetric(horizontal: 10);
  }
}
// class AppDiscountCard extends StatelessWidget {
//   AppDiscountCard({
//     Key? key,
//     this.desc,
//     required this.image,
//     required this.descColor,
//     this.btnText,
//   }) : super(key: key);
//
//   String? desc;
//   String image;
//   Color? descColor;
//   String? btnText;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), color: Colors.white),
//       height: 300,
//       width: Get.size.width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           10.0.addHSpace(),
//           'Get Your Free XO Discount Card'.interTextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 15,
//               maxLines: 4,
//               textOverflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               fontColor: descColor ?? Colors.black),
//           Image.asset(
//             image,
//             fit: BoxFit.cover,
//             height: 165,
//             width: 165,
//           ),
//           desc != null
//               ? desc?.interTextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 14,
//                   maxLines: 4,
//                   textOverflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   fontColor: descColor ?? Colors.black)
//               : Container(),
//           btnText != null
//               ? BorderButton(
//                   appBorderFillColor: Colors.white,
//                   appFillColor: Colors.transparent,
//                   onTap: () {},
//                   text: btnText!,
//                   fontSize: 12,
//                   value: 10,
//                 )
//               : Container()
//         ],
//       ).paddingSymmetric(horizontal: 5),
//     ).paddingSymmetric(horizontal: 10);
//   }
// }
