import 'package:flutter/material.dart';

import 'package:social_value/utils/extension.dart';

import '../../../../widgets/common_card.dart';

class AwarenessDaysScreen extends StatelessWidget {
  const AwarenessDaysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
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
                  "April 2023".interTextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  20.0.addHSpace(),
                  AwarenessDaysCard(
                    date: "2nd",
                    day: "Purple Day",
                    day2: "Mothering Sunday",
                    day3: "World Autism Day",
                  ),
                  27.0.addHSpace(),
                  AwarenessDaysCard(
                    date: "23nd",
                    day: "Purple Day",
                    day2: "Mothering Sunday",
                    day3: "World Autism Day",
                  ),
                  27.0.addHSpace(),
                  AwarenessDaysCard(
                    date: "23nd",
                    day: "Purple Day",
                    day2: "",
                    day3: "",
                  ),
                ],
              ),
            ),
            30.0.addHSpace(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
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
                  "April 2023".interTextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  20.0.addHSpace(),
                  AwarenessDaysCard(
                    date: "2nd",
                    day: "Purple Day",
                    day2: "Mothering Sunday",
                    day3: "World Autism Day",
                  ),
                  27.0.addHSpace(),
                  AwarenessDaysCard(
                    date: "23nd",
                    day: "Purple Day",
                    day2: "Mothering Sunday",
                    day3: "World Autism Day",
                  ),
                  27.0.addHSpace(),
                  AwarenessDaysCard(
                    date: "23nd",
                    day: "Purple Day",
                    day2: "",
                    day3: "",
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
