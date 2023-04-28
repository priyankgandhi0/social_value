import 'package:flutter/cupertino.dart';

class HomeCardModel {
  String desc;
  String title;
  String image;
  Function onTap;

  HomeCardModel(
      {required this.title,
      required this.onTap,
      required this.image,
      required this.desc});
}
