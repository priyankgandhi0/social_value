import 'package:flutter/material.dart';
import 'package:social_value/theme/app_color.dart';

class BottomNaviBarScreen extends StatelessWidget {
  const BottomNaviBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(80), topLeft: Radius.circular(100))),
    );
  }
}
