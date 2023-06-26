import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:social_value/generated/asset.dart';
import 'package:social_value/utils/extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../constant/app_url.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/app_button.dart';

class FinancesDiscountCard extends StatelessWidget {
  const FinancesDiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffF4F4F4)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3,
                        offset: const Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Image.asset(
                    ImageAssets.discountCard,
                  ),
                  20.0.addHSpace(),
                  AppBorderButton(
                    text: startSavingNow,
                    borderColor: darkDeepPurple,
                    onTap: () {
                      Get.to(const DisCountCardWebView());
                    },
                  ).paddingOnly(left: 60, right: 60)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class DisCountCardWebView extends StatelessWidget {
  const DisCountCardWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkDeepPurple,
      ),
      body: WebView(
        initialUrl: discountCardUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
