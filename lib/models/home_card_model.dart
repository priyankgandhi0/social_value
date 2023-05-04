import 'package:flutter/cupertino.dart';

class HomeCardModel {
  String desc;
  String title;
  String image;
  Color color;
  VoidCallback onTap;

  HomeCardModel(
      {required this.title,
      required this.onTap,
      required this.image,
      required this.color,
      required this.desc});
}
