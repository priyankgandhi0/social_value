import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:social_value/utils/extension.dart';

import '../constant/app_string.dart';

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

  final double? height;
  final double? width;
  final String? desc;
  final String image;

  final Color? descColor;
  final String? btnText;
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
            20.0.addHSpace(),
            desc != null
                ? SizedBox(
                    height: 50,
                    child: desc?.interTextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        fontColor: descColor ?? Colors.black),
                  )
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
  const AppArticlesCard({
    Key? key,
    required this.desc,
    required this.image,
    required this.descColor,
    this.btnText,
  }) : super(key: key);

  final String desc;
  final String image;
  final Color? descColor;
  final String? btnText;

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
  const AppVideoCommonCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

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
              blurRadius: 2,
              // spreadRadius: 2,
              offset: const Offset(2, 3))
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
  const AppWorkOutCard({
    Key? key,
    required this.title,
    required this.image,
    this.titleColor,
  }) : super(key: key);

  final String title;
  final String image;
  final Color? titleColor;

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
  const InsuranceCard({Key? key, required this.title, this.icon})
      : super(key: key);
  final String title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 190,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: darkDeepPurple, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.interTextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, fontColor: white),
          5.0.addHSpace(),
          insurance.interTextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, fontColor: white),
          40.0.addHSpace(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [FaIcon()],
          // ),
        ],
      ),
    );
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
  const AppBodyPumptCard({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
    this.titleColor,
  }) : super(key: key);

  final String title;
  final String image;
  final Color? titleColor;
  final VoidCallback? onTap;

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
  const WorkOutCard({
    Key? key,
    required this.title,
    required this.image,
    this.titleColor,
  }) : super(key: key);

  final String title;
  final String image;
  final Color? titleColor;

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

class AwarenessDaysCard extends StatelessWidget {
  const AwarenessDaysCard(
      {Key? key,
      required this.date,
      required this.day,
      required this.day2,
      required this.day3})
      : super(key: key);
  final String date;
  final String day;
  final String day2;
  final String day3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: darkPurple, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: date.interTextStyle(
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontColor: white),
                )),
            25.0.addWSpace(),
            day.interTextStyle(fontSize: 14, fontWeight: FontWeight.w400)
          ],
        ),
        1.0.addHSpace(),
        Row(
          children: [
            70.0.addWSpace(),
            day2.interTextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ],
        ),
        15.0.addHSpace(),
        Row(
          children: [
            70.0.addWSpace(),
            day3.interTextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ],
        )
      ],
    );
  }
}

class AlcoholFreeCard extends StatelessWidget {
  const AlcoholFreeCard({
    Key? key,
    required this.data,
    required this.firstLetter,
  }) : super(key: key);
  final Widget data;
  final String firstLetter;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF4F4F4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                offset: const Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Transform(
              transform: Matrix4.skewX(0.15),
              child: Container(
                  alignment: Alignment.topLeft,
                  height: 50,
                  width: 60,
                  color: darkPurple,
                  child: Center(
                    child: firstLetter.interTextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontColor: Colors.white),
                  )),
            ),
          ),
          20.0.addWSpace(),
          data
        ],
      ),
    ).paddingOnly(bottom: 20);
  }
}

class ShelterCard extends StatelessWidget {
  const ShelterCard(
      {Key? key, required this.image, required this.desc, required this.link})
      : super(key: key);

  final String image;
  final String desc;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF4F4F4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                offset: const Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shelter.interTextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              Image.asset(image)
            ],
          ),
          10.0.addHSpace(),
          desc.interTextStyle(fontWeight: FontWeight.w400, fontSize: 13),
          link.interTextStyle(
              textDecoration: TextDecoration.underline,
              fontWeight: FontWeight.w400,
              fontSize: 13),
        ],
      ),
    ).paddingOnly(bottom: 15);
  }
}

class QuestionsCard extends StatelessWidget {
  const QuestionsCard(
      {Key? key,
      required this.question,
      required this.date,
      required this.onTap})
      : super(key: key);
  final String question;
  final String date;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF4F4F4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                offset: const Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          question.interTextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          15.0.addHSpace(),
          Row(
            children: [
              "Complete by: "
                  .interTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              date.interTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ],
          ),
          25.0.addHSpace(),
          GestureDetector(
            onTap: onTap,
            child: Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: darkSky)),
                child: Center(
                  child: "Start Now".interTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                )).paddingOnly(bottom: 15),
          )
        ],
      ),
    ).paddingOnly(bottom: 15);
  }
}

class VolunterringCard extends StatelessWidget {
  const VolunterringCard({
    Key? key,
    this.height,
    this.width,
    this.image,
    required this.text,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2,
              // spreadRadius: 2,
              offset: const Offset(1, 0))
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.0.addHSpace(),
          Image.asset(
            image ?? Assets.imagesVolunterringLogo,
            height: height ?? 70,
            width: width ?? Get.width,
          ),
          15.0.addHSpace(),
          text.interTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          15.0.addHSpace(),
          'Visit the Reach Website.'.interTextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, fontColor: darkPurple),
          20.0.addHSpace(),
        ],
      ).paddingSymmetric(horizontal: 15),
    );
  }
}

class ReasonVolunterringCard extends StatelessWidget {
  const ReasonVolunterringCard({
    Key? key,
    this.height,
    this.width,
    this.image,
    required this.text,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2,
              // spreadRadius: 2,
              offset: const Offset(1, 0))
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          20.0.addHSpace(),
          Image.asset(
            image ?? Assets.imagesReasonVolun,
            height: height ?? 50,
            width: width ?? 50,
          ),
          15.0.addWSpace(),
          Expanded(
              child: Center(
            child: text.interTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ))
        ],
      ).paddingSymmetric(horizontal: 15, vertical: 10),
    );
  }
}

class ScorePageCard extends StatelessWidget {
  ScorePageCard({
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

  final String scoreTitle;
  final String scoreDesc;
  final String score;
  double percentage = 0.0;
  final Color bgColor;
  final Color percentageColor;
  final Color? scoreTitleColor;
  final Color? scoreDescColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: bgColor),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              15.0.addWSpace(),
              CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 7.0,
                percent: percentage,
                center: score.appEpilogueTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    fontColor: percentageColor),
                progressColor: percentageColor,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    13.0.addHSpace(),
                    scoreTitle.interTextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        fontColor: scoreTitleColor ?? const Color(0xff333333)),
                    10.0.addHSpace(),
                    scoreDesc.interTextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        fontColor: scoreDescColor ?? const Color(0xff444444)),
                  ],
                ).paddingSymmetric(horizontal: 10),
              ),
            ]).paddingSymmetric(vertical: 15),
          ),
          15.0.addHSpace(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child:
                'Develop an overarching green and sustainability policy that demonstrates your business commitment to managing its environmental impacts'
                    .interTextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          15.0.addHSpace(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child:
                'See the link below for more information on writing a business sustainability policy'
                    .interTextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          5.0.addHSpace(),
        ],
      ).paddingSymmetric(vertical: 10, horizontal: 10),
    );
  }
}
