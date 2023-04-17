// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import 'package:social_value/utils/extension.dart';

class AppDrawerItem extends StatelessWidget {
  AppDrawerItem(
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
                  Image.asset(
                    appImage,
                    color: Colors.black,
                    width: 25,
                    height: 25,
                  ),
                  20.00.addWSpace(),
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
          thickness: 2,
        )
      ],
    );
  }
}
