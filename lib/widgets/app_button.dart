import 'package:flutter/material.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

class AppFilledButton extends StatelessWidget {
  AppFilledButton(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.buttonColor,
      this.showWidget = false,
      required this.onTap})
      : super(key: key);
  final String text;
  final Function() onTap;
  double? fontSize;
  FontWeight? fontWeight;
  final Color? fontColor;
  final Color? buttonColor;
  final bool showWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(8),
        ),
        child: text.openSansTextStyle(
          fontSize: fontSize ?? 17,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontColor: fontColor ?? Colors.white,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(color: darkPurple),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text.interTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                fontColor: const Color(0xff333333)),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Color(0xff333333),
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
