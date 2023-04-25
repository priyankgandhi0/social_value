import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:social_value/utils/extension.dart';
import '../constant/app_string.dart';

import '../theme/app_color.dart';

import 'app_button.dart';
import 'common_textfield.dart';

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

class PlanetScore extends StatelessWidget {
  PlanetScore({
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
      // color: bgColor,
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 7.0,
              percent: percentage,
              center: score.appEpilogueTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  fontColor: percentageColor),
              progressColor: percentageColor,
            ),
            8.0.addHSpace(),
            scoreTitle.interTextStyle(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontColor: scoreTitleColor ?? const Color(0xff333333)),
            8.0.addHSpace(),
            scoreDesc.interTextStyle(
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontSize: 13,
                fontColor: scoreDescColor ?? const Color(0xff444444))
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

class HowToGetStartedCard extends StatelessWidget {
  const HowToGetStartedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF4F4F4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 3,
                offset: const Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          howToGetStarted.interTextStyle(
              fontSize: 16, fontWeight: FontWeight.w700),
          16.0.addHSpace(),
          RichText(
            text: const TextSpan(
              text: '',
              style: TextStyle(
                color: textColor,
              ),
              children: [
                TextSpan(
                  text: step1,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: step1Desc,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          20.0.addHSpace(),
          RichText(
            text: const TextSpan(
              text: '',
              style: TextStyle(
                color: textColor,
              ),
              children: [
                TextSpan(
                  text: step2,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: step2Desc,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          20.0.addHSpace(),
          RichText(
            text: const TextSpan(
              text: '',
              style: TextStyle(
                color: textColor,
              ),
              children: [
                TextSpan(
                  text: step3,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: step3Desc,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          20.0.addHSpace(),
          Container(
            padding:
                const EdgeInsets.only(right: 10, left: 15, top: 10, bottom: 10),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffEFC4C4)),
            child: goToWebSide.interTextStyle(
                fontColor: const Color(0xff131313),
                fontWeight: FontWeight.w400,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}

class CompleteFormCard extends StatelessWidget {
  const CompleteFormCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffF4F4F4)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 3,
                  offset: const Offset(3, 3))
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            completeTheFormToGetStarted.interTextStyle(
                fontSize: 16, fontWeight: FontWeight.w700),
            10.0.addHSpace(),
            name.interTextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            10.0.addHSpace(),
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      StartUpTextFiled(
                        fontColor: Colors.grey,
                        headingText: "",
                        headingTextColor: white,
                        isCursorShow: true,
                        borderColor: Colors.grey.shade300,
                        fillColor: white,
                      ),
                      4.0.addHSpace(),
                      Row(
                        children: [
                          firstName.interTextStyle(
                              fontColor: const Color(0xff555555),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)
                        ],
                      )
                    ],
                  ),
                ),
                20.0.addWSpace(),
                Flexible(
                  child: Column(
                    children: [
                      StartUpTextFiled(
                        fontColor: Colors.grey,
                        headingText: "",
                        headingTextColor: white,
                        isCursorShow: true,
                        borderColor: Colors.grey.shade300,
                        fillColor: white,
                      ),
                      4.0.addHSpace(),
                      Row(
                        children: [
                          lastName.interTextStyle(
                              fontColor: const Color(0xff555555),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            20.0.addHSpace(),
            "Email".interTextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            10.0.addHSpace(),
            Row(
              children: [
                Flexible(
                  child: StartUpTextFiled(
                    fontColor: Colors.grey,
                    headingText: "",
                    headingTextColor: white,
                    isCursorShow: true,
                    borderColor: Colors.grey.shade300,
                    fillColor: white,
                  ),
                ),
                20.0.addWSpace(),
                const Flexible(child: SizedBox()),
              ],
            ),
            20.0.addHSpace(),
            AppFilledButton(
              width: 110,
              buttonColor: darkDeepPurple,
              text: submit,
              onTap: () {},
            )
          ],
        ));
  }
}

class AddictionCard extends StatelessWidget {
  AddictionCard({
    Key? key,
    this.color,
    required this.title,
    required this.desc,
  }) : super(key: key);
  Color? color;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: double.infinity,
      color: color,
      child: Row(
        children: [
          title.interTextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          desc.interTextStyle(
              fontColor: darkDeepPurple,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ],
      ),
    );
  }
}

class XoDiscountCard extends StatelessWidget {
  XoDiscountCard(
      {Key? key,
      required this.image,
      this.appBorderFillColor,
      required this.desc})
      : super(key: key);

  final String image;
  final String desc;
  Color? appBorderFillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF4F4F4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 3,
                offset: const Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getYourFreeXODiscountCard.interTextStyle(
              fontSize: 17, fontWeight: FontWeight.w700),
          10.0.addHSpace(),
          Image.asset(image),
          10.0.addHSpace(),
          Container(
              // height: 60,
              padding: const EdgeInsets.all(10),
              // width: double.infinity,
              decoration: BoxDecoration(
                  color: lightDeepPurple,
                  borderRadius: BorderRadius.circular(8)),
              child: desc.interTextStyle(
                  fontSize: 12,
                  maxLines: 4,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  fontColor: textColor)),
          20.0.addHSpace(),
          AppBorderButton(
                  text: startSavingNow,
                  borderColor: appBorderFillColor ?? darkDeepPurple)
              .paddingOnly(left: 60, right: 60)
        ],
      ),
    );
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
