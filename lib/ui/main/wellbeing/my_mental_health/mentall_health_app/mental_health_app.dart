import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../widgets/wellbeing_screen_card.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MentalHealthApp extends StatefulWidget {
  const MentalHealthApp({Key? key}) : super(key: key);

  @override
  State<MentalHealthApp> createState() => _MentalHealthAppState();
}

class _MentalHealthAppState extends State<MentalHealthApp> {
  WebViewController? webViewController;

  // @override
  // void initState() {
  //   webViewController = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..loadHtmlString(
  //         "<iframe frameborder='0' style='height:500px;width:99%;border:none;' src='https://forms.zohopublic.eu/dan25/form/InsightTimerAppRequest/formperma/pKLshzm66IyxtmcC8fgdc4pzURmhfn2a43Or863ttZY'></iframe>");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          20.0.addHSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 141,
                width: 191,
                child: Image.asset(
                  ImageAssets.cupImage,
                  // color: backGroundColor,
                ),
              ),
              10.0.addWSpace(),
              Container(
                height: 114,
                width: 170,
                decoration: BoxDecoration(
                    color: darkDeepPurple,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Free Access\nfor all\nSVC Members".appEpilogueTextStyle(
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontColor: white)
                  ],
                ),
              ),
            ],
          ),
          15.0.addHSpace(),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF4F4F4)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 3,
                      offset: const Offset(3, 3))
                ],
                borderRadius: BorderRadius.circular(8)),
            child: mentalHealthAppDesc.interTextStyle(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          20.0.addHSpace(),
          const HowToGetStartedCard(),
          20.0.addHSpace(),

          Container(
            height: 540,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF4F4F4)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 3,
                      offset: const Offset(3, 3))
                ],
                borderRadius: BorderRadius.circular(8)),
            child: const WebView(
                backgroundColor: Colors.white,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl:
                    "https://forms.zohopublic.eu/dan25/form/InsightTimerAppRequest/formperma/pKLshzm66IyxtmcC8fgdc4pzURmhfn2a43Or863ttZY"),
          )
          // const CompleteFormCard(),
          // Container(
          //   height: 500,
          //   padding: const EdgeInsets.all(16),
          //   margin: const EdgeInsets.symmetric(horizontal: 17),
          //   decoration: BoxDecoration(
          //       border: Border.all(color: const Color(0xffF4F4F4)),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //             color: Colors.grey.shade400,
          //             blurRadius: 3,
          //             offset: const Offset(3, 3))
          //       ],
          //       borderRadius: BorderRadius.circular(8)),
          //   child: Html(
          //     shrinkWrap: true,
          //     data:
          //         "<iframe frameborder='0' style='height:500px;width:99%;border:none;' src='https://forms.zohopublic.eu/dan25/form/InsightTimerAppRequest/formperma/pKLshzm66IyxtmcC8fgdc4pzURmhfn2a43Or863ttZY'></iframe>",
          //   ),
          // )
        ],
      ).paddingOnly(bottom: 30),
    );
  }
}
