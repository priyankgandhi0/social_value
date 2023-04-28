import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: Get.height,
        color: Colors.transparent.withOpacity(0),
        child: Center(
            child: CircularProgressIndicator(
          color: Colors.white.withOpacity(0.8),
        )));
  }
}
