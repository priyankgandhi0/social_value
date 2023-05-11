import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrainGamesPlayScreen extends StatelessWidget {
  BrainGamesPlayScreen({Key? key}) : super(key: key);
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final dynamic data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
                initialUrl: data["url"],
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            )
          ],
        ).paddingOnly(top: 40),
      ),
    );
  }
}
