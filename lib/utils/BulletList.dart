import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;
  bool? isBulletText = false;
  double? left, right, top, bottom;

  BulletList(this.strings,
      {super.key,
      this.isBulletText,
      this.left,
      this.right,
      this.bottom,
      this.top});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: left ?? 23.0,
          right: right ?? 10,
          bottom: bottom ?? 0.0,
          top: top ?? 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isBulletText == true
                  ? const Text(
                      '\u2022',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        height: 1.25,
                      ),
                    )
                  : Container(),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: str.interTextStyle(
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ).paddingSymmetric(vertical: 5),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
