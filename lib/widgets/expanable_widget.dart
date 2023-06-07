import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../theme/app_color.dart';

Widget expandedTile(String title,String subTitle, Function() onclick, {bool? isExpandable}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        alignment: Alignment.centerLeft,
        width: Get.size.width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 0),
                    child: title.interTextStyle(
                      fontColor: textColor,
                      fontSize: 15,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      textOverflow: TextOverflow.clip,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                isExpandable == true
                    ? const Icon(
                        Icons.keyboard_arrow_up_sharp,
                        color: textColor,
                        size: 15,
                      ).paddingOnly(right: 10)
                    : const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: textColor,
                        size: 15,
                      ).paddingOnly(right: 10),
              ],
            ),
            10.0.addHSpace(),
            isExpandable == true
                ? Column(
                  children: [

                    1.0.addDivider(),


                    SizedBox(
                        child: subTitle.interTextStyle(
                        fontColor: textColor,
                        fontSize: 15,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                      )).paddingOnly(left: 14),
                  ],
                )
                : const SizedBox()
          ],
        )).paddingSymmetric(vertical: 5),
  );
}
