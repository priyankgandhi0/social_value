import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/bulletlist.dart';
import '../../../../widgets/common_card.dart';

class VolunteeringScreen extends StatelessWidget {
  const VolunteeringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(Assets.imagesGiveBackVolun),
          ),
          15.0.addHSpace(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: lightPurple),
            child: BulletList(
              const [
                'There are many reasons why people should volunteer, but one of the most important is that it can benefit both the volunteer and the community.',
                'When people give their time and energy to help others, they often find that they also get a lot back in return.',
                'Volunteers often report feeling a sense of satisfaction and purpose, as well as a sense of connection to their community. In addition, volunteering can also help to build skills and experiences that can be valuable in the workplace..',
                'It’s good for you, and it’s good for your community.',
              ],
              left: 10,
              right: 10,
              top: 10,
              bottom: 10,
            ),
          ),
          15.0.addHSpace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child:
                'Here are 3 of the leading volunteering organisations in the UK'
                    .interTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          15.0.addHSpace(),
          const VolunterringCard(
            text:
                'Reach Volunteering is the leading skills-based volunteering charity and the UK’s single biggest source of trustees for the voluntary sector. Their vision is to create a world where people come together to create a thriving, fair and sustainable society. They inspire, support and connect civil society organisations and volunteers to work together, sharing skills and expertise to create a better society.',
          ),
          10.0.addHSpace(),
          const VolunterringCard(
            text:
                'Reach Volunteering is the leading skills-based volunteering charity and the UK’s single biggest source of trustees for the voluntary sector. Their vision is to create a world where people come together to create a thriving, fair and sustainable society. They inspire, support and connect civil society organisations and volunteers to work together, sharing skills and expertise to create a better society.',
          ),
          10.0.addHSpace(),
          const VolunterringCard(
            text:
                'Reach Volunteering is the leading skills-based volunteering charity and the UK’s single biggest source of trustees for the voluntary sector. Their vision is to create a world where people come together to create a thriving, fair and sustainable society. They inspire, support and connect civil society organisations and volunteers to work together, sharing skills and expertise to create a better society.',
          ),
          10.0.addHSpace(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(Assets.images10reasonBg),
          ),
          20.0.addHSpace(),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ReasonVolunterringCard(
                      text:
                          'Reach Volunteering is the leading skills-based volunteering charity and the UK’s single biggest source of trustees for the voluntary sector.')
                  .paddingSymmetric(vertical: 5);
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 10, vertical: 20),
    );
  }
}
