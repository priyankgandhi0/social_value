import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_color.dart';

extension AppText on String {
  appEpilogueTextStyle({
    Color? fontColor,
    double? fontSize,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    FontWeight? fontWeight,
    int? maxLines,
    TextAlign? textAlign,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.epilogue(color: fontColor ?? black, fontSize: fontSize ?? 16, fontWeight: fontWeight, fontStyle: FontStyle.normal, decoration: textDecoration ?? TextDecoration.none,),
      textAlign: textAlign,
    );
  }
}

extension AppText2 on String {
  Text interTextStyle({
    Color? fontColor,
    double? fontSize,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    FontWeight? fontWeight,
    int? maxLines,
    TextAlign? textAlign,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.inter(fontStyle: FontStyle.normal, color: fontColor ?? textColor, fontSize: fontSize ?? 16, fontWeight: fontWeight, decoration: textDecoration ?? TextDecoration.none),
      textAlign: textAlign,
    );
  }
}

extension AppText3 on String {
  openSansTextStyle({
    Color? fontColor,
    double? fontSize,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    FontWeight? fontWeight,
    int? maxLines,
    TextAlign? textAlign,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.openSans(fontStyle: FontStyle.normal, color: fontColor ?? textColor, fontSize: fontSize ?? 16, fontWeight: fontWeight, decoration: textDecoration ?? TextDecoration.none),
      textAlign: textAlign,
    );
  }
}

Widget appCommonTextSpan({
  Color color = Colors.black,
  Color childColor = Colors.black,
  double size = 20,
  double? childsize,
  TextAlign align = TextAlign.center,
  FontWeight weight = FontWeight.w500,
  FontWeight childweight = FontWeight.w300,
  TextOverflow? overflow,
  int? maxLines,
  String? text,
  String? childText,
  TextDecoration? decoration,
  TextDecoration? childDecoration,
  VoidCallback? onTapUp,
}) {
  return Text.rich(
      maxLines: maxLines,
      overflow: overflow,
      TextSpan(
          text: text ?? '',
          style: GoogleFonts.inter(
              fontSize: size,
              color: color,
              // color: isDarkMode ? Colors.white : color,
              fontWeight: weight,
              decoration: decoration),
          children: <InlineSpan>[
            TextSpan(
                text: childText ?? '',
                style: GoogleFonts.inter(fontSize: childsize ?? size, color: childColor, fontWeight: childweight, decoration: childDecoration),
                recognizer: TapGestureRecognizer()..onTap = onTapUp)
          ]));
}

Decoration indicatorWidth(Color? color) {
  return UnderlineTabIndicator(
    borderSide: BorderSide(color: color ?? white, width: 2),
    insets: const EdgeInsets.only(bottom: 0),
  );
}

/// Use this extension for add space in
extension Space on double {
  addHSpace() {
    return SizedBox(height: this);
  }

  addWSpace() {
    return SizedBox(
      width: this,
    );
  }


}



extension AppDivider on double {
  addDivider () {
    return Divider(
      thickness: this,
    );
  }
}


extension AppExpanded on Widget {
  Expanded expand({Key? key, int flex = 1}) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }
}


extension NumberParsing on int {
  String toOrdinalString() {
    if ((this < 0)) {
      //here you change the range
      throw Exception('0');
    }
    if (this == 0) {
      return '0';
    }

    String stringValue = toString();

    switch (stringValue[stringValue.length - 1]) {
      case '1':
        return '${stringValue}st';
      case '2':
        return '${stringValue}nd';
      case '3':
        return '${stringValue}rd';
      default:
        return '${stringValue}th';
    }
  }
}
