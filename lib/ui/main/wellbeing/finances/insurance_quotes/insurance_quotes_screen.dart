import 'package:flutter/material.dart';

import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/common_card.dart';

import '../../../../../constant/app_string.dart';

import '../../../../../theme/app_color.dart';

class FinancesInsuranceQuotes extends StatelessWidget {
  const FinancesInsuranceQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
            saveOnInsuranceQuotes.interTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontColor: textColor),
            15.0.addHSpace(),
            getQuotesFromARangeOfProviders.interTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontColor: textColor),
            15.0.addHSpace(),
            selectTheTypeOfInsuranceYouRequire.interTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontColor: const Color(0xff555555)),
            27.0.addHSpace(),
            const CircleAvatar(
              backgroundColor: darkDeepPurple,
              child: Icon(
                Icons.arrow_downward,
                color: white,
              ),
            ),
            27.0.addHSpace(),
            GridView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const InsuranceCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
