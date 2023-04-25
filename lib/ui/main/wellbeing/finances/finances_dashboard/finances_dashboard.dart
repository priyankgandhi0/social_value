import 'package:flutter/material.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../generated/assets.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';

class FinancesDashBoard extends StatelessWidget {
  const FinancesDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            financesHome.interTextStyle(
                fontSize: 17, fontWeight: FontWeight.w700),
            10.0.addHSpace(),
            Container(
              padding: const EdgeInsets.all(20),
              // margin: const EdgeInsets.symmetric(horizontal: 17),
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
                  lookingForFinancialSupport.interTextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                  8.0.addHSpace(),
                  supportServicesToHelp.interTextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  8.0.addHSpace(),
                  Image.asset(ImageAssets.financesCard)
                ],
              ),
            ),
            20.0.addHSpace(),
            XoDiscountCard(
              image: Assets.imagesCreditCard,
              appBorderFillColor: darkDeepPurple,
              desc: memberShipDesc,
            ),
            20.0.addHSpace(),
            latestArticlesText.interTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontColor: textColor),
            10.0.addHSpace(),
            SizedBox(
              height: 165,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppArticlesCard(
                      descColor: Colors.black,
                      desc:
                          'Diabetes - What you need to knowabout this condition',
                      image: Assets.imagesWorkoutImg);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
