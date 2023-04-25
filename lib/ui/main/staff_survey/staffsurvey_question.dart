import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/app_button.dart';

import '../../../constant/app_string.dart';
import '../../../models/app_tab_bar_model.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/appbar_chip.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';
/*

class StaffSurveyQuestion extends StatefulWidget {
  const StaffSurveyQuestion({Key? key}) : super(key: key);

  @override
  State<StaffSurveyQuestion> createState() => _StaffSurveyQuestionState();
}

String selected = "";

class _StaffSurveyQuestionState extends State<StaffSurveyQuestion> {
  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: staffSurvey,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  "Question ".interTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  "1 of 25".interTextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ],
              ),
              20.0.addHSpace(),
              titleQuestion.interTextStyle(
                  fontWeight: FontWeight.w700, fontSize: 17),
              20.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "a" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.grey),
                  child: RadioListTile(
                    title: "a".interTextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                    value: "a",
                    groupValue: selected,
                    activeColor: darkSky,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              10.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "b" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RadioListTile(
                    title: const Text("b"),
                    value: "b",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              10.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "c" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RadioListTile(
                    title: const Text("c"),
                    value: "c",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              10.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "d" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RadioListTile(
                    title: const Text("d"),
                    value: "d",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              40.0.addHSpace(),
              AppBorderButton(text: next, borderColor: darkSky)
                  .paddingOnly(right: 230)
            ],
          ),
        ),
      ),
    );
  }
}
*/

class StaffSurveyQuestion extends StatefulWidget {
  const StaffSurveyQuestion({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<StaffSurveyQuestion> {
  int _value = 0;
  final List<GroupModel> _group = [
    GroupModel(text: "A", index: 1, selected: false),
    GroupModel(text: "B", index: 2, selected: false),
    GroupModel(text: "C", index: 3, selected: false),
    GroupModel(text: "D", index: 4, selected: false),
  ];
  Widget makeRadioTiles() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _group.length; i++) {
      list.add(Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            border:
                Border.all(color: _group[i].selected ? darkSky : Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: RadioListTile(
          value: _group[i].index,
          groupValue: _value,
          selected: _group[i].selected,
          toggleable: false,
          onChanged: (val) {
            setState(() {
              for (int i = 0; i < _group.length; i++) {
                _group[i].selected = false;
              }
              _value = val!;
              _group[i].selected = true;
            });
          },
          activeColor: darkSky,
          title: _group[i]
              .text
              .interTextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ).paddingOnly(bottom: 15));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: staffSurvey,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  "Question ".interTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  "1 of 25".interTextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ],
              ),
              20.0.addHSpace(),
              titleQuestion.interTextStyle(
                  fontWeight: FontWeight.w700, fontSize: 17),
              20.0.addHSpace(),
              makeRadioTiles(),

              /*  Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "a" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.grey),
                  child: RadioListTile(
                    title: "a".interTextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                    value: "a",
                    groupValue: selected,
                    activeColor: darkSky,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              10.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "b" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RadioListTile(
                    title: const Text("b"),
                    value: "b",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              10.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "c" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RadioListTile(
                    title: const Text("c"),
                    value: "c",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              10.0.addHSpace(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selected == "d" ? darkSky : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: RadioListTile(
                    title: const Text("d"),
                    value: "d",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value.toString();
                      });
                    },
                  ),
                ),
              ),
              40.0.addHSpace(),*/
              AppBorderButton(text: next, borderColor: darkSky)
                  .paddingOnly(right: 230)
            ],
          ),
        ),
      ),
    );
  }
}
