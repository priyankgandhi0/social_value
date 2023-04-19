// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:social_value/utils/extension.dart';

class AppMenuItem extends StatelessWidget {
  AppMenuItem(
      {Key? key,
      this.itemOnTap,
      required this.appImage,
      required this.appItemText})
      : super(key: key);
  String appImage;
  String appItemText;
  Function()? itemOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: itemOnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    appImage,
                    width: 25,
                    height: 25,
                  ),
                  25.00.addWSpace(),
                  appItemText.openSansTextStyle(
                      fontSize: 18,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ],
          ).paddingOnly(top: 10, bottom: 10, right: 20, left: 20),
        ),
        const Divider(
          color: Color(0xffE4E4E4),
          thickness: 1,
        )
      ],
    );
  }
}
