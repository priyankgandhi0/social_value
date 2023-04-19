import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:social_value/utils/extension.dart';

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
