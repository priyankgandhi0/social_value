import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double value;
  final Color? appButtonColor;
  final Color? appFillColor;
  final Color? appTextFillColor;
  final Color? appBorderFillColor;
  bool? rightIcon = false;
  FontWeight? fontWeight;
  double? fontSize;

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: GoogleFonts.workSans(
                    color: appTextFillColor ?? Colors.white,
                    fontSize: fontSize ?? 15,
                    fontWeight: fontWeight ?? FontWeight.w600)),
            10.0.addWSpace(),
            rightIcon == true ? Icon(Icons.chevron_right) : Container(),
          ],
        ));
  }
}
