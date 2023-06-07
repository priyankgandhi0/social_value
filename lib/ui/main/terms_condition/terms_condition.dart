import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../constant/app_string.dart';
import '../../../constant/app_url.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/appbar_chip.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      bottomColor: darkSky,
      backGround: white,
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: termsConditions,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: const WebView(
        backgroundColor: Colors.white,
        initialUrl: termsUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       'Introduction'.interTextStyle(
      //         fontWeight: FontWeight.w700,
      //         fontSize: 20,
      //       ),
      //       15.0.addHSpace(),
      //       'Historically, society disregarded the notion that a child’s mental health could be disturbed (Aries, 1962).In the 1970s, depression was typically viewed as an adult disorder because children were seen as too developmentally immature to have this disorder. The Diagnostic and statistical manual of mental disorders (DSM) by the American Psychiatric Association did not represent children until its third edition in 1980.'
      //           .interTextStyle(
      //         fontWeight: FontWeight.w400,
      //         fontSize: 12,
      //       ),
      //       15.0.addHSpace(),
      //       'It’s normal for children to feel down, think negatively, or be cranky this is part of their healthy development and learning to manage emotions. But childhood depression is more than just feeling sad, blue, or low. It is a mental health problem that affects children’s thinking, mood, and behaviour. Children experiencing depression often feel negative about themselves, their situation, and their future.'
      //           .interTextStyle(
      //         fontWeight: FontWeight.w400,
      //         fontSize: 12,
      //       ),
      //       15.0.addHSpace(),
      //       'Introduction'.interTextStyle(
      //         fontWeight: FontWeight.w700,
      //         fontSize: 20,
      //       ),
      //       15.0.addHSpace(),
      //       'Historically, society disregarded the notion that a child’s mental health could be disturbed (Aries, 1962).In the 1970s, depression was typically viewed as an adult disorder because children were seen as too developmentally immature to have this disorder. The Diagnostic and statistical manual of mental disorders (DSM) by the American Psychiatric Association did not represent children until its third edition in 1980.'
      //           .interTextStyle(
      //         fontWeight: FontWeight.w400,
      //         fontSize: 12,
      //       ),
      //       15.0.addHSpace(),
      //       'It’s normal for children to feel down, think negatively, or be cranky this is part of their healthy development and learning to manage emotions. But childhood depression is more than just feeling sad, blue, or low. It is a mental health problem that affects children’s thinking, mood, and behaviour. Children experiencing depression often feel negative about themselves, their situation, and their future.'
      //           .interTextStyle(
      //         fontWeight: FontWeight.w400,
      //         fontSize: 12,
      //       ),
      //     ],
      //   ).paddingSymmetric(horizontal: 20, vertical: 40),
      // ),
    );
  }
}
