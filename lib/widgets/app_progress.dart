import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/app_color.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: Get.height,
        color: Colors.transparent.withOpacity(0),
        child: Center(
            child: CircularProgressIndicator(
          color: color ?? Colors.white.withOpacity(0.8),
        )));
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? black,
      highlightColor: Colors.grey[500] ?? black,
      direction: ShimmerDirection.ltr,
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        height: 115,
        width: 188,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2,
              offset: const Offset(2, 3))
        ], color: white, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
