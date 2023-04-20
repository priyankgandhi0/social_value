import 'package:flutter/cupertino.dart';

class AppTabBarModel {
  String tabText;
  Widget tabWidget;
  Function onTap;

  AppTabBarModel(
      {required this.tabText, required this.tabWidget, required this.onTap});
}
