import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.width,
      this.buttonColor,
      this.showWidget = false,
      required this.onTap})
      : super(key: key);
  final String text;
  final Function() onTap;
  final double? fontSize;
  final double? width;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Color? buttonColor;
  final bool showWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: buttonColor ?? lightGreen,
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

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double value;
  final Color? appButtonColor;
  final Color? appFillColor;
  final Color? appTextFillColor;
  final Color? appBorderFillColor;
  bool? rightIcon = false;
  final FontWeight? fontWeight;
  final double? fontSize;

  BorderButton({
    Key? key,
    required this.text,
    this.appButtonColor,
    this.appFillColor,
    this.appTextFillColor,
    this.appBorderFillColor,
    this.fontWeight,
    this.fontSize,
    this.rightIcon,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateProperty.all(appFillColor ?? Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(value),
              side: BorderSide(color: appBorderFillColor ?? Colors.white))),
        ),
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.workSans(
                    color: appTextFillColor ?? Colors.white,
                    fontSize: fontSize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.w600)),
            rightIcon == true
                ? const Icon(
                    Icons.chevron_right,
                    size: 18,
                  )
                : Container(),
          ],
        ));
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

class AppBorderButton extends StatelessWidget {
  const AppBorderButton(
      {Key? key,
      this.onTap,
      this.textSize,
      required this.text,
      required this.borderColor})
      : super(key: key);
  final String text;
  final double? textSize;
  final Color borderColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: text.interTextStyle(
                textAlign: TextAlign.center,
                fontSize: textSize ?? 16,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
