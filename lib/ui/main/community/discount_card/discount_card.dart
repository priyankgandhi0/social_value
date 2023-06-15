import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../../../../constant/app_string.dart';
import '../../../../generated/asset.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/app_button.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   ImageAssets.discountCard,
                  // ),

                  10.0.addHSpace(),
                  const Text('''GET YOUR FREE XO DISCOUNT CARD MEMBERSHIP''',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),


                  Image.asset(ImageAssets.cardImage),
                  8.0.addHSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsAssets.bookMarkIcon),
                      12.0.addWSpace(),
                      const Text("Get discount at your favourite retails",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)
                    ],
                  ),
                  5.0.addHSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsAssets.bookMarkIcon),
                      10.0.addWSpace(),
                      const Expanded(child: Text('''Great deals and offers on beauty , travel , fashion and more''',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),textAlign: TextAlign.start,))
                    ],
                  ),
                  5.0.addHSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsAssets.bookMarkIcon),
                      10.0.addWSpace(),
                      const Expanded(child: Text('''Free for you to access  ''',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),textAlign: TextAlign.start,))
                    ],
                  ),


                  5.0.addHSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsAssets.bookMarkIcon),
                      10.0.addWSpace(),
                      const Expanded(child: Text('''100\' of massive deals and bargains''',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),textAlign: TextAlign.start,))
                    ],
                  ),
                  10.0.addHSpace(),
                  Image.asset(ImageAssets.retailsImage),
                  20.0.addHSpace(),
                  AppBorderButton(
                    text: 'Start Saving doesn\'t do anything',
                    // text: startSavingNow,
                    borderColor: darkPurple,
                    onTap: () {},
                  ).paddingOnly(left: 60, right: 60)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
