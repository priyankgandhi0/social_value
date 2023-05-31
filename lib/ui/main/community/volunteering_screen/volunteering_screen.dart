// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/ui/main/community/volunteering_screen/volunteering_controller.dart';
import 'package:social_value/utils/extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant/const_listData.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/bulletlist.dart';
import '../../../../widgets/app_progress.dart';
import '../../../../widgets/common_card.dart';

class VolunteeringScreen extends StatelessWidget {
   VolunteeringScreen({Key? key}) : super(key: key);


  final VolunteeringController controller = Get.find<VolunteeringController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: GetBuilder<VolunteeringController>(
            initState: (state){
              Future.delayed(Duration.zero)
                  .then((value) => controller.getVolunteering());
            },
            builder: (controller){
              return Column(
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
                  volunteeringView(controller),
                  20.0.addHSpace(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(Assets.images10reasonBg),
                  ),
                  20.0.addHSpace(),
                  ListView.builder(
                    itemCount: volunteeringData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return  ReasonVolunterringCard(
                          text: '${volunteeringData[index].details}',
                        count: '${volunteeringData[index].id}',
                      )
                          .paddingSymmetric(vertical: 10);
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 10, vertical: 20);
            },
        )
        ),
        Obx(() => controller.isLoading.value
            ? const AppProgress(
          color: darkPurple,
        )
            : Container()),
      ],
    );
  }

  volunteeringView(VolunteeringController crl){
    return ListView.builder(
      itemCount: crl.getVolunteeringData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,i){
          return  VolunteeringCard(
            image: crl.getVolunteeringData[i].image,
            text: '${crl.getVolunteeringData[i].text}',
            title: '${crl.getVolunteeringData[i].title}',
            webLink: '${crl.getVolunteeringData[i].link}',
            onTap: () { _launchURL('${crl.getVolunteeringData[i].link}'); },
          ).paddingAll(12);
        }
    );
  }
   _launchURL(String url) async {
     final Uri webViewUrl = Uri.parse(url);
     if (await canLaunchUrl(webViewUrl)) {
       await launch(
         webViewUrl.toString(),
       );
       //await launchUrl(webViewUrl);
     } else {
       throw 'Could not launch $url';
     }
   }
}
