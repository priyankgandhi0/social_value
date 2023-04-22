import 'package:flutter/material.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

import '../../constant/app_string.dart';
import '../../widgets/wellbeing_screen_card.dart';

class SupportServices extends StatelessWidget {
  const SupportServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  right: 10, left: 15, top: 10, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEFC4C4)),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF5D3D3)),
              child: ifYouNeedImmediate.interTextStyle(
                  fontColor: const Color(0xffA55B5B),
                  fontWeight: FontWeight.w400,
                  fontSize: 13),
            ),
            20.0.addHSpace(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              // height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addiction.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      textDecoration: TextDecoration.underline),
                  20.0.addHSpace(),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    // color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    // color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                ],
              ),
            ),
            20.0.addHSpace(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              // height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addiction.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      textDecoration: TextDecoration.underline),
                  20.0.addHSpace(),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    // color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    // color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                ],
              ),
            ),
            20.0.addHSpace(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              // height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addiction.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      textDecoration: TextDecoration.underline),
                  20.0.addHSpace(),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    // color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    // color: lightDeepPurple,
                  ),
                  AddictionCard(
                    title: servicesTitle,
                    desc: servicesDesc,
                    color: lightDeepPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
