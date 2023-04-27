import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

showAppSnackBar(
  String tittle,
) {
  return Get.showSnackbar(GetSnackBar(
    messageText: tittle.interTextStyle(
        fontSize: 18, fontColor: Colors.white, textAlign: TextAlign.start),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: const Icon(
      Icons.error_outline,
      color: Colors.white,
    ),
    backgroundColor: darkGreen,
    duration: const Duration(seconds: 3),
  ));
}
