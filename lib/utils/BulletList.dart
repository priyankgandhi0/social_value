import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;
  bool? isBulletText = false;

  BulletList(this.strings, {super.key, this.isBulletText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 23.0, right: 10),
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
