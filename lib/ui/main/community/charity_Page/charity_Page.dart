import 'package:flutter/material.dart';
import 'package:social_value/constant/charity_card_const.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/common_card.dart';
import '../../../../constant/app_string.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Container(
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
                  ourCharitablePledge.interTextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                  13.0.addHSpace(),
                  helpingOurCharity.interTextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                  13.0.addHSpace(),
                  ourCharitablePledgeDesc.interTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12),
                ],
              ),
            ),
            15.0.addHSpace(),
            ListView.builder(
              itemCount: charityCard.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CharityCard(
                  image: charityCard[index].image,
                  desc: charityCard[index].desc,
                  link: charityCard[index].link,
                  title: charityCard[index].title,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
