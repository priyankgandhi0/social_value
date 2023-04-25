import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../theme/app_color.dart';

Widget expandedTile(String title, Function() onclick, {bool? isExpandable}) {
  return InkWell(
    onTap: onclick,
    child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: title.interTextStyle(
                fontColor: textColor,
                fontSize: 15,
                maxLines: 1,
                textAlign: TextAlign.start,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
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
        )),
  );
}