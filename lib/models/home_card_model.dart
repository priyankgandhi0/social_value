import 'package:flutter/cupertino.dart';

class HomeCardModel {
  String text;
  String subText;
  String image;
  Function onTap;
  Color color;

  HomeCardModel(
      {required this.subText,
      required this.onTap,
      required this.image,
      required this.color,
      required this.text});
}
