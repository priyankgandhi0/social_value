import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../constant/app_string.dart';
import '../generated/assets.dart';
import '../theme/app_color.dart';
import 'app_button.dart';

class ExploreHubCard extends StatelessWidget {
  const ExploreHubCard(
      {Key? key,
      required this.hubName,
      required this.hubDesc,
      required this.image,
      required this.color})
      : super(key: key);
  final String hubName;
  final String hubDesc;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 100,
            width: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.0.addHSpace(),
          hubName.interTextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          5.0.addHSpace(),
          hubDesc.interTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              textAlign: TextAlign.center),
        ]),
      ),
    ).paddingOnly(right: 15);
  }
}

class LesmillsCard extends StatelessWidget {
  const LesmillsCard({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              Assets.imagesLesMills,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            100.0.addHSpace(),
            Center(
              child: Image.asset(
                Assets.imagesLessmills,
              ),
            ),
            15.0.addHSpace(),
            lesmillsText.interTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontColor: white,
                textAlign: TextAlign.center),
            15.0.addHSpace(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 35,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    accessNow.interTextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        fontColor: white),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: white,
                      size: 15,
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class MemberShipCard extends StatelessWidget {
  const MemberShipCard({Key? key, this.onTap, required this.text})
      : super(key: key);
  final VoidCallback? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2,
            // spreadRadius: 2,
            offset: const Offset(2, 2))
      ], color: Colors.grey, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            height: 116,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
            child: Image.asset(Assets.imagesCreditCard).paddingAll(10),
          ),
          Container(
            height: 116,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: lightPurple,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  text.interTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontColor: textColor),
                  10.0.addHSpace(),
                  AppButton(text: accessNow, onTap: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
