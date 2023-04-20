import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

import '../theme/app_color.dart';

class AppBarChip extends StatelessWidget {
  AppBarChip(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.color,
      required this.onTap})
      : super(key: key);
  final String text;
  final Color textColor;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30,
          // width: 120,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: text.interTextStyle(
                fontColor: textColor,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ).paddingOnly(left: 15, right: 15)),
    );
  }
}
