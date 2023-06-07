import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../widgets/app_progress.dart';

class BrainGamesPlayScreen extends StatefulWidget {
  const BrainGamesPlayScreen({Key? key}) : super(key: key);

  @override
  State<BrainGamesPlayScreen> createState() => _BrainGamesPlayScreenState();
}

class _BrainGamesPlayScreenState extends State<BrainGamesPlayScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool isLoading = true;

  final dynamic data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 650,
                  // width: double.infinity,
                  child: WebView(
                    backgroundColor: Colors.white,
                    initialUrl: data["url"],
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onPageFinished: (finish) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                )
              ],
            ).paddingOnly(top: 40),
          ),
          Visibility(
            visible: isLoading,
            child: const Center(
              child: AppProgress(
                color: darkPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
