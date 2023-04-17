import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appButtonText(
    {required FontWeight fontWeight,
    required double fontSize,
    Color fontColor = Colors.white}) {
  return GoogleFonts.basic(
    color: fontColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

Text sitTextCommon(String text,
    {Color? color,
    double? fontsize,
    FontWeight? weight,
    TextAlign? align,
    FontStyle? fontStyle,
    int maxLine = 1,
    TextOverflow? overflow}) {
  return Text(
    text,
    textAlign: align,
    maxLines: maxLine,
    style: TextStyle(
        fontStyle: fontStyle,
        color: color,
        // fontFamily: nova,
        fontSize: fontsize,
        fontWeight: weight,
        overflow: overflow),
  );
}

void printData({required dynamic tittle, dynamic val}) {
  if (kDebugMode) {
    print("$tittle:-$val");
  }
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

extension AppExpanded on Widget {
  Expanded expand({Key? key, int flex = 1}) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }
}

extension AddText on String {
  isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  Widget appCommonText(
      {Color? color,
      double? fontsize,
      FontWeight? weight,
      TextAlign? align,
      FontStyle? fontStyle,
      int maxLine = 1,
      TextOverflow? overflow}) {
    return Text(
      this,
      style: TextStyle(
          fontStyle: fontStyle,
          color: color,
          fontSize: fontsize,
          fontWeight: weight,
          overflow: overflow),
      textAlign: align,
    );
  }

  toStringDateFormat() {
    List<String> date = split('/');
    return '${date[2]}-${date[1]}-${date[0]}';
  }
}

/*
extension AppText on String {
  startUpTittleText() {
    return Text(
      this,
      style: GoogleFonts.roboto(
          fontSize: 29, fontWeight: wallyBoldWeight, color: Colors.black),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  buttonText(Color color) {
    return Text(
      this,
      style: GoogleFonts.roboto(
          fontSize: 24, fontWeight: wallyLightWeight, color: color),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  wallyText(
      {required double size,
        required FontWeight fontWeight,
        Color? color,
        int? maxLines,
        TextAlign? textAlign,
        TextOverflow? textOverflow}) {
    return Text(
      this,
      style: GoogleFonts.roboto(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines ?? 1,
      overflow: textOverflow ?? TextOverflow.ellipsis,
    );
  }

  termsConditionText() {
    return Text(
      this,
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  hasValidUrl() {
    return RegExp(
        r'[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?')
        .hasMatch(this);
  }

  isValidEmail() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  grayText() {
    return Text(
      this,
      style: dark4(),
    );
  }

  smallText({Color? color, double size = 16}) {
    return Text(
      this,
      style: const TextStyle(fontSize: 15),
    );
  }
}*/

extension PaddingExtentions on Widget {
  Padding pSymmetricOnly({
    Key? key,
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Padding pOnly({
    Key? key,
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(right: right, top: top, left: left, bottom: bottom),
        child: this,
      );
}

// showAppSnackBar(String tittle, {bool status = false}) {
//   // return Get.showSnackbar(GetSnackBar(
//   //   message: tittle,
//   //   duration: const Duration(seconds: 3),
//   // ));
//
//   return Get.showSnackbar(GetSnackBar(
//     // message: tittle,
//     messageText: Text(
//       tittle,
//       textAlign: TextAlign.start,
//       style: wallyTextStyle(
//         fontWeight: wallyLightWeight,
//         fontSize: 17,
//       ),
//     ),
//     // messageText: tittle.wallyText(fontSize: 24, fontWeight: wallyLightWeight, color: color),
//     borderRadius: 15,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     shouldIconPulse: false,
//     icon: Icon(
//       status ? Icons.check_circle_outline_rounded : Icons.error_outline,
//       color: Colors.black.withOpacity(0.5),
//     ),
//     backgroundColor: primaryColor,
//     duration: const Duration(seconds: 3),
//   ));
// }
